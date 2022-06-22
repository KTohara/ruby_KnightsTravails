# frozen_string_literal: true

require_relative 'board'
require_relative 'knight'

board = Board.new
knight = Knight.new([0, 0])
p knight.valid_moves([0, 0])
final = board.build_move_tree([0, 0], [5, 2])
p board.find_path([0, 0], [5, 1])