# rubocop-rspec-focused

RuboCop lint for focused specs.

It finds `focus: true` and the following method calls:

  * `focus`
  * `fexample`
  * `fit`
  * `fspecify`
  * `fcontext`
  * `fdescribe`

```ruby
# bad
fit 'does something' do
  expect(foo).to be_empty
end

fdescribe Something do
  it 'does something' do
    expect(foo).to be_empty
  end
end

specify 'does something', focus: true do
  expect(foo).to be_empty
end

specify 'does something', :focus do
  expect(foo).to be_empty
end

# good
it 'does something' do
  expect(foo).to be_empty
end

describe Something do
  it 'does something' do
    expect(foo).to be_empty
  end
end

specify 'does something' do
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
