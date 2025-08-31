# frozen_string_literal: true

class StringCalculator
  def self.add(input)
    return 0 if input.nil? || input.empty?

    delimiter = "\n|,"
    if input.start_with?("//")
      custom_delimiter = Regexp.escape(input[2])
      delimiter = "#{delimiter}|#{custom_delimiter}"
      input = input[4..]
    end
      numbers = input.split(/#{delimiter}/).map(&:to_i)
      return numbers[0] if numbers.size == 1

      numbers.sum
  end
end
