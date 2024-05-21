require 'tdd_calculator'

RSpec.describe TddCalculator do
  describe '#add' do
    let(:calculator) { TddCalculator.new }

    context 'handle for empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end
  end
end