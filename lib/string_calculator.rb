# frozen_string_literal: true

class StringCalculator
  def self.add(input)
    return 0 if input.nil? || input.empty?

    delimiter, number_string = extract_delimiter(input)
    numbers = number_string.split(/#{delimiter}/).map(&:to_i)

    negative_numbers = numbers.select(&:negative?)
    return "Negative numbers not allowed #{negative_numbers.join(', ')}" unless negative_numbers.empty?

    numbers = numbers.reject{ |num| num>1000}

    return numbers[0] if numbers.size == 1

    numbers.sum
  end

  private
  def self.extract_delimiter(input)
    delimiter = "\n|,"
    if input.start_with?("//")
      delimiter_line, extracted_numbers = input.split("\n", 2)
      custom_delimiter = Regexp.escape(delimiter_line[2])
      ["#{delimiter}|#{custom_delimiter}", extracted_numbers]
    else
      [delimiter, input]
    end
  end
end
