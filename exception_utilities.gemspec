# -*- encoding: utf-8 -*-
require File.expand_path('../lib/exception_utilities/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kenta Murata"]
  gem.email         = ["mrkn@mrkn.jp"]
  gem.description   = %q{Utilities for handling exceptions}
  gem.summary       = %q{Exception handling utilities}
  gem.homepage      = "http://github.com/mrkn/exception_utilities"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "exception_utilities"
  gem.require_paths = ["lib"]
  gem.version       = ExceptionUtilities::VERSION

  gem.add_development_dependency('rspec', '~> 2.12.0')
  if RUBY_VERSION < '1.9'
    gem.add_development_dependency('rcov', '~> 1.0.0')
  else
    gem.add_development_dependency('simplecov-rcov', '~> 0.2.3')
  end
end
