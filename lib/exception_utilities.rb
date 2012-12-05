require "exception_utilities/version"

module ExceptionUtilities
  class Error < StandardError; end

  module_function

  def exceptions_ignoring_eval(*modules)
    unless modules.all? {|ec| Module === ec }
      raise Error, 'only Module instances are accepted'
    end
    yield
  rescue *modules => exception
    exception
  end
end

module Kernel
  def exceptions_ignoring_eval(*modules, &block)
    ExceptionUtilities.exceptions_ignoring_eval *modules, &block
  end
end
