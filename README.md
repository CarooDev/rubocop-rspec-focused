# rubocop-rspec-focused

RuboCop lint for focused specs.

```ruby
# bad
fit 'does something' do
  expect(foo).to be_empty
end

it 'does something', focus: true do
  expect(foo).to be_empty
end

# good
it 'does something' do
  expect(foo).to be_empty
end
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rubocop-rspec-focused', require: false
```

And then execute:

    $ bundle

And add this to your `.rubocop.yml`:

```yml
require:
  - rubocop/rspec/focused

Rspec/Focused:
  Enabled: true
```

## Contributing

1. Fork it ( https://github.com/lovewithfood/rubocop-rspec-focused/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
