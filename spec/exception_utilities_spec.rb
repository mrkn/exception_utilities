require 'spec_helper'

describe ExceptionUtilities do
  describe '#exceptions_ignoring_eval' do
    context 'when called with an exception class' do
      it 'should ignore an exception which is an instance of specified exception class' do
        expect {
          exceptions_ignoring_eval(RuntimeError) { raise }
        }.to_not raise_error(RuntimeError)
      end

      it 'should return the ignored exception' do
        exceptions_ignoring_eval(RuntimeError) { raise }.should be_a(RuntimeError)

        exc = Class.new(RuntimeError)
        exceptions_ignoring_eval(RuntimeError) { raise exc }.should be_a(exc)
      end

      it 'should ignore an exception which is an instance_of an exception class that is a subclass of the specified one' do
        exc = Class.new(RuntimeError)
        expect {
          exceptions_ignoring_eval(RuntimeError) { raise exc }
        }.to_not raise_error(exc)
      end

      it 'should not ignore an exception which is an instance of an exception class that is not a subclass of the specified one' do
        exc = Class.new(TypeError)
        expect {
          exceptions_ignoring_eval(RuntimeError) { raise exc }
        }.to raise_error(exc)
      end
    end

    context 'when called with two exception classes' do
      it 'should ignore an exception which is an instance of an exception class that is a subclass of each of these' do
        expect {
          exceptions_ignoring_eval(LoadError, RuntimeError) { raise LoadError }
        }.to_not raise_error(LoadError)

        exc = Class.new(RuntimeError)
        expect {
          exceptions_ignoring_eval(LoadError, RuntimeError) { raise exc }
        }.to_not raise_error(RuntimeError)
      end
    end

    context 'when called with an object not an exception class' do
      it 'should raise ExceptionUtilities::Error' do
        expect {
          exceptions_ignoring_eval(Object.new) { }
        }.to raise_error(ExceptionUtilities::Error)
      end
    end

    context 'when called with an exception class and an object not an exception class' do
      it 'should raise ExceptionUtilities::Error' do
        expect {
          exceptions_ignoring_eval(LoadError, Object.new) { }
        }.to raise_error(ExceptionUtilities::Error)
      end
    end
  end
end