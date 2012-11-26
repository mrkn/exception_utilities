# -*- encoding: utf-8 -*-
require File.expand_path('../lib/exception_utilities/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Kenta Murata"]
  gem.email         = ["mrkn@cookpad.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "exception_utilities"
  gem.require_paths = ["lib"]
  gem.version       = ExceptionUtilities::VERSION
end