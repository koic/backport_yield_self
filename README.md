# backport_yield_self [![Build Status](https://travis-ci.org/koic/backport_yield_self.svg)](https://travis-ci.org/koic/backport_yield_self) [![Gem Version](https://badge.fury.io/rb/backport_yield_self.svg)](http://badge.fury.io/rb/backport_yield_self)

backport_yield_self is the backport of `Kernel#yield_self` in Ruby 2.5 to older Ruby versions.

The best way is to use Ruby 2.5 or later. Because you can use original `yield_self` method and so on.

## Installation

Add these lines to your application's Gemfile:

```
gem 'backport_yield_self'
```

And then execute:

```
$ bundle install
```

Or install it yourself as:

```
$ gem install backport_yield_self
```

And require it as:

```
require 'backport_yield_self'
```

## Synopsis

```ruby
'my string'.yield_self {|s| s.upcase } #=> "MY STRING"
3.next.yield_self {|x| x**x }.to_s     #=> "256"
```

## Supported Ruby versions

* Ruby 2.2
* Ruby 2.3
* Ruby 2.4

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

backport_yield_self is released under the [MIT License](http://www.opensource.org/licenses/MIT).

### Get the original codes

* Kernel#yield_self [https://github.com/ruby/ruby/commit/cec0668](https://github.com/ruby/ruby/commit/cec0668209483a3f233574211c4b8fbd3d1d64b7)

## Special Thanks

* Ruby Development Team
