# frozen_string_literal: true

class StringCalculator
  def self.add(input)
    if input.nil? || input.empty?
      0
    else
      numbers = input.split(',').map { |num| num.to_i }
      numbers.inject(0) { |sum, num| sum + num }
    end
  end
end
