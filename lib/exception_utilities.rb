require "exception_utilities/version"

module ExceptionUtilities
  class Error < StandardError; end

  module_function

  def exceptions_ignoring_eval(*modules)
    unless modules.all? {|ec| Module === ec }
      raise Error, 'only Module instances are accepted'
    end
    begin
      yield
    rescue *modules => exception
      exception
    end
  end

  def exception_matcher(&block)
    Module.new do
      (class << self; self; end).class_eval do
        define_method(:===, &block)
      end
    end
  end

  def exceptions_with_message(pattern, *exception_classes)
    exception_classes << StandardError if exception_classes.empty?
    exception_matcher do |exception|
      case exception
      when *exception_classes
        pattern === exception.message rescue false
      else
        false
      end
    end
  end
end
