# frozen_string_literal: true

require_relative '00_base_class'

class AdventDay01 < AdventOfCode2023
	def initialize
		super(file_path: '../input/01.txt')

		@calibrations = []
	end

	def solve
		parse_input_lines do |line|
			calibration_number = get_line_calibration_number(line)

			@calibrations << calibration_number
		end

		@calibrations.sum
	end

	private

	def get_line_calibration_number line
		digits = line.gsub(/[^\d]/, '').split('')

		calibration = digits.first + digits.last
		calibration.to_i
	end
end

solution = AdventDay01.new.solve
p solution

