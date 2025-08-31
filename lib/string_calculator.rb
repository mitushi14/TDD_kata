# frozen_string_literal: true

class StringCalculator
  def self.add(input)
    delimiter = "\n|,"
    if input.nil? || input.empty?
      0
    else
      if input.start_with?('//')
        custom_delimiter = Regexp.escape(input[2])
        delimiter = "#{delimiter}|#{custom_delimiter}"
        input = input[4..]
      end
      numbers = input.split(/#{delimiter}/).map { |num| num.to_i }
      return numbers[0] if numbers.size == 1

      numbers.inject(0) { |sum, num| sum + num }
    end
  end
end
