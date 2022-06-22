# frozen_string_literal: true

# Knight movement
class Knight
  attr_accessor :pos, :considered_positions, :children, :parent

  def initialize(pos, parent = nil)
    @pos = pos
    @parent = parent
    @children = []
  end

  PATHS = [
    [1, 2], [1, -2], [-1, 2], [-1, -2],
    [2, 1], [2, -1], [-2, 1], [-2, -1]
  ].freeze

  def valid_moves(position)
    x, y = position
    PATHS.inject([]) do |acc, move|
      new_pos = [x + move.first, y + move.last]
      acc << new_pos if new_pos.all? { |coord| coord.between?(0, 7) } && new_pos != parent.pos
      acc
    end

  end

  def inspect
    "#{pos}"
  end
end
