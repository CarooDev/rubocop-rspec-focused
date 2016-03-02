require 'spec_helper'
require 'rubocop/cop/rspec/focused'

RSpec.describe RuboCop::Cop::RSpec::Focused do
  subject(:cop) { described_class.new }

  described_class::FOCUSED_METHODS.each do |method|
    it "finds #{method}" do
      inspect_source(cop, ["#{method} 'does something' do",
                           '  expect(foo).to be_empty',
                           'end'])
      expect(cop.offenses.size).to eq(1)
      expect(cop.offenses.map(&:line).sort).to eq([1])
      expect(cop.messages).to eq([described_class::MESSAGE])
    end
  end

  (described_class::FOCUSED_METHODS - [:focus]).each do |method|
    it "autocorrects #{method}" do
      source = ["#{method} 'does something' do", '  expect(foo).to be_empty', 'end']

      expected_source = [
        "#{method[1..-1]} 'does something' do", '  expect(foo).to be_empty', 'end'
      ].join("\n")

      autocorrected_source = autocorrect_source(cop, source)
      expect(autocorrected_source).to eq(expected_source)
    end
  end

  it 'finds an example with focus: true' do
    inspect_source(cop, ['it "does something", foo: bar, focus: true do',
                         '  expect(foo).to be_empty',
                         'end'])
    expect(cop.offenses.size).to eq(1)
    expect(cop.offenses.map(&:line).sort).to eq([1])
    expect(cop.messages).to eq([described_class::MESSAGE])
  end

  it 'finds an example with :focus' do
    inspect_source(cop, ['it "does something", :js, :focus do',
                         '  expect(foo).to be_empty',
                         'end'])
    expect(cop.offenses.size).to eq(1)
    expect(cop.offenses.map(&:line).sort).to eq([1])
    expect(cop.messages).to eq([described_class::MESSAGE])
  end

  it 'does not raise error on block without arguments' do
    inspect_source(cop, ['it "does something" do',
                         '  expect(foo).to be_empty',
                         'end'])
    expect(cop.offenses.size).to eq(0)
    expect(cop.offenses.map(&:line).sort).to be_empty
    expect(cop.messages).to be_empty
  end
end
