# Split::Mongoid

A Mongoid persistence layer for your A/B tests that use the Split Ruby
gem.

## Installation

Add this line to your application's Gemfile:

    gem 'split-mongoid'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install split-mongoid

## Usage

Include in the Mongoid classes that will use the a/b tests:

```ruby
class User
  include Mongoid::Document
  include Split::Mongoid
end
```

Then, run your a/b tests:

```ruby
user = User.new

user.ab_tests("favorite_superhero", "Superman", "Spiderman") do |hero|
  puts hero
end
```

Then, when finished, run:

```ruby
user.finished("favorite_superhero")
```

Reporting works exactly the same as the Split gem.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
