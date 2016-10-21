# Endeavour

Endeavour is a simple gem that adds a `try` method to `Object` and `NilClass`
instances. `try` permits calling a method on an object and returning `nil`
rather than `NoMethodError` if the object is `nil` or does not respond to
the method.

## Usage

There are two ways to use `try`:

### 1. Call-based syntax (similar to Rails' [Object#try](http://api.rubyonrails.org/classes/Object.html#method-i-try))

```ruby
car.try(:drive)

colors.try(:[], :red)
```

### 1. Delegate syntax (inspired by [HoboSupport](http://www.hobocentral.net/manual/hobo_support))

```ruby
car.try.drive

colors.try[:red]
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'endeavour'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install endeavour

### Rails applications

Endeavour uses a
[Railtie](http://api.rubyonrails.org/classes/Rails/Railtie.html) and can be
used after initialization without additional configuration.

### Non-Rails applications

Call `Endeavour.hook!` early in your application.

### Remove Endeavour

In some cases, you may want to remove Endeavour (say, if a naughty gem requires
it).  You can do so with `Endeavour.remove_hook!`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/allspiritseve/endeavour.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

