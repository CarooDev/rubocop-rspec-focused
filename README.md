# rubocop-rspec-focused

[![Build Status](https://travis-ci.org/lovewithfood/rubocop-rspec-focused.svg?branch=master)](https://travis-ci.org/lovewithfood/rubocop-rspec-focused)

RuboCop lint for focused specs.

***WARNING: We are no longer maintaining this gem, and will eventually archive this repo. We recommend you use [rubocop-rspec](https://github.com/rubocop-hq/rubocop-rspec) instead.***

This gem finds `focus: true` and the following method calls:

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

RSpec/Focused:
  Enabled: true
```

## Contributing

1. Fork it ( https://github.com/lovewithfood/rubocop-rspec-focused/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


For running the spec files, this project depends on RuboCop's spec helpers.
This means that in order to run the specs locally, you need a (shallow) clone
of the RuboCop repository:

```bash
git submodule update --init vendor/rubocop
```
