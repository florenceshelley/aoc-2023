# frozen_string_literal: true

require_relative '00_base_class'

class AdventDay01 < AdventOfCode2023
	def initialize
		super(file_path: '../input/01.txt')

		@calibrations = []
	end

	def solve
		parse_input_lines do |line|
			calibration = calibration_number(line)

			@calibrations << calibration
		end

		@calibrations.sum
	end

	private

	def calibration_number line
		digits = get_first_and_last_digits(line)
		calibration = digits.first + digits.last

		calibration.to_i
	end

	def get_first_and_last_digits line
		raise NotImplementedError
	end
end

class Part01 < AdventDay01
	def initialize
		super
	end

	private

	def get_first_and_last_digits line
		line.gsub(/[^\d]/, '').split('')
	end
end

class Part02 < AdventDay01
	def initialize
		super
	end

	private

	WORD_TO_NUMBER_MAPPINGS = {
		'one' => '1',
		'two' => '2',
		'three' => '3',
		'four' => '4',
		'five' => '5',
		'six' => '6',
		'seven' => '7',
		'eight' => '8',
		'nine' => '9'
	}

	def get_first_and_last_digits line
		# Use a lookahead to find 
		regex = Regexp.new("(?=(#{number_pattern})).*(#{number_pattern})")
		digits = line.match(regex).captures

		map_words_to_numbers(digits)
	end

	def number_pattern
		number_words = WORD_TO_NUMBER_MAPPINGS.keys.join('|')
		['\d', number_words].join('|')
	end

	def map_words_to_numbers words
		words.map do |word|
			WORD_TO_NUMBER_MAPPINGS[word] || word
		end
	end
end

part_1_solution = Part01.new.solve
part_2_solution = Part02.new.solve

p "Part 1: #{part_1_solution}, Part 2: #{part_2_solution}"
