# frozen_string_literal: true

class AdventOfCode2023
	def initialize file_path:
		@file_path = file_path
	end

	def parse_input_lines &block
		raise ArgumentError, 'a block must be provided' unless block_given?

		lines = parse_input_file

		lines.each do |line|
			yield line
		end
	end

	private

	def parse_input_file
		file = File.foreach(@file_path)

		file.map do |entry|
			entry.chomp
		end
	end
end

