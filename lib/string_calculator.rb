# frozen_string_literal: true

class StringCalculator
  def self.add(input)
    if input.nil? || input.empty?
      0
    else
      input.to_i
    end
  end
end
