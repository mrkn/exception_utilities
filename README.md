# ExceptionUtilities

Utilities for handling exceptions.

## Installation

Add this line to your application's Gemfile:

    gem 'exception_utilities'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exception_utilities

## Usage

### Ignoring specific exceptions

Use ```exceptions_ignoring_eval```:

```ruby
exceptions_ignoring_eval(LoadError) do
  require 'foo'
end
```

### Rescue exceptions having specific message

Use ```exceptions_with_message```:

```ruby
begin
  SomeModel.create!
rescue exceptions_with_message(/\Bfoo_bar_id\B/, ActiveRecord::RecordNotFound)
  Rails.logger.debug([$!.message, *$!.backtrace].join("\n"))
end
```

### Creating exception matcher

Use ```exception_matcher```:

```ruby
begin
  # some routine
rescue exception_matcher {|exc| exc.count <=1 }
  # ignore
rescue exception_matcher {|exc| exc.count > 1 }
  raise
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
