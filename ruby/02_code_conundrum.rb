# frozen_string_literal: true

require_relative '00_base_class'
require 'set'

class AdventDay02 < AdventOfCode2023
	CUBE_COUNT_CRITERIA = {
		'red' => 12,
		'green' => 13,
		'blue' => 14
	}.freeze

	def initialize
		super(file_path: '../input/02.txt')

		@possible_games = Set[]
		@impossible_games = Set[]
	end

	def solve
		parse_input_lines do |line|
			track_possible_games(line)
		end

		@possible_games.sum
	end

	private

	def track_possible_games line
		game_data, cube_data = line.split(': ')

		game_id = game_data.gsub('Game ', '').to_i
		cube_counts = cube_data.split('; ').flat_map { |set| set.split(', ') }

		cube_counts.each do |cube_count|
			count, colour = cube_count.split(' ')
			count = count.to_i

			if count > CUBE_COUNT_CRITERIA[colour]
				@impossible_games.add(game_id)
			end
		end

		unless @impossible_games.include?(game_id)
			@possible_games.add(game_id)
		end
	end
end

part_1_solution = AdventDay02.new.solve

p "Part 1: #{part_1_solution}"

