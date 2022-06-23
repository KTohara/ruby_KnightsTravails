# frozen_string_literal: true

require_relative 'board'
require_relative 'knight'

board = Board.new

board.find_path([0, 0], [1, 2])
board.find_path([0, 0], [7, 7])
board.find_path([7, 7], [7, 3])
