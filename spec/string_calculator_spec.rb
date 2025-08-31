# frozen_string_literal: true

require 'rspec'
require 'string_calculator'

RSpec.describe StringCalculator do
  describe '.add' do
    context 'when given input is empty string' do
      it 'returns 0' do
        expect(StringCalculator.add('')).to eq(0)
      end
    end

    context 'when given input is nil' do
      it 'returns 0' do
        expect(StringCalculator.add(nil)).to eq(0)
      end
    end

    context 'when given input is single number' do
      it 'returns the number itself' do
        expect(StringCalculator.add('7')).to be_a(Integer)
        expect(StringCalculator.add('7')).to eq(7)
      end
    end

    context 'when given input is comma seperated numbers' do
      it 'returns the sum of those numbers' do
        expect(StringCalculator.add('7,8')).to eq(15)
      end
    end

    context 'when given input is newline seperated numbers' do
      it 'returns the sum of those numbers' do
        expect(StringCalculator.add('4\n7')).to eq(11)
        expect(StringCalculator.add('4\n3\n8')).to eq(15)
      end
    end

    context 'when given input is comma and newline seperated numbers' do
      it 'returns the sum of those numbers' do
        expect(StringCalculator.add('2,8\n10')).to eq(20)
      end
    end
  end
end
