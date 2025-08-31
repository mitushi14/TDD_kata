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
        expect(StringCalculator.add("7")).to be_a(Integer)
        expect(StringCalculator.add("7")).to eq(7)
      end
    end

    context 'when given input is comma seperated numbers' do
      it 'returns the sum of those numbers' do
        expect(StringCalculator.add("7,8")).to eq(15)
      end
    end

    context 'when given input is newline seperated numbers' do
      it 'returns the sum of those numbers' do
        expect(StringCalculator.add("4\n7")).to eq(11)
        expect(StringCalculator.add("4\n3\n8")).to eq(15)
      end
    end

    context 'when given input is comma and newline seperated numbers' do
      it 'returns the sum of those numbers' do
        expect(StringCalculator.add("2,8\n10")).to eq(20)
      end
    end

    context 'when given input contains custom delimiter with beginning of line as separate line' do
      it 'returns the sum of those numbers' do
        expect(StringCalculator.add("//;\n1;2")).to eq(3)
      end
    end

    context 'when given input contains a negative number' do
      it 'throws exception negative negative numbers not allowed <negative_number>' do
        expect(StringCalculator.add("-12,2")).to eq("Negative numbers not allowed -12")
      end
    end

    context 'when given input contains multiple negative numbers' do
      it 'throws exception negative negative numbers not allowed <negative_number>, <negative_number_2>' do
        expect(StringCalculator.add("-12,-6,-4")).to eq("Negative numbers not allowed -12, -6, -4")
      end
    end

    context 'when given input contains number greater than 1000' do
      it 'ignores those numbers in sum' do
        expect(StringCalculator.add("5,89,1003")).to eq(94)
        expect(StringCalculator.add("4,7,1000")).to eq(1011)
      end
    end
  end
end
