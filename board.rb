# frozen_string_literal: true
require 'byebug'
require_relative 'knight'

class Board
  def find_path(start_pos, final_pos)
    last_node = build_move_tree(start_pos, final_pos)
    history = make_history(last_node)
  end

  def build_move_tree(start_pos, final_pos)
    queue = [Knight.new(start_pos)]
    current = queue.shift
    until current.pos == final_pos
      current.valid_moves(current.pos).each do |next_pos|
        current.children << knight = Knight.new(next_pos, current)
        queue << knight
      end
      current = queue.shift
    end
    current
  end

  def make_history(current)
    history = []
    until current.parent.nil?
      history << current.pos
      current = current.parent
    end
    history << current.pos
  end
end

# disp current
# disp current.valid_moves(current.pos)