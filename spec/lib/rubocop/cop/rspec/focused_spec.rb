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

  it 'finds an example with focus: true' do
    inspect_source(cop, ['it "does something", foo: bar, focus: true do',
                         '  expect(foo).to be_empty',
                         'end'])
    expect(cop.offenses.size).to eq(1)
    expect(cop.offenses.map(&:line).sort).to eq([1])
    expect(cop.messages).to eq([described_class::MESSAGE])
  end
end
