# frozen_string_literal: true

# Knight node
class Knight
  attr_reader :start_pos, :children, :parent

  def initialize(start_pos, parent = nil)
    @start_pos = start_pos
    @parent = parent
    @children = []
    @visited = [start_pos]
  end

  MOVES = [
    [1, 2], [1, -2], [-1, 2], [-1, -2],
    [2, 1], [2, -1], [-2, 1], [-2, -1]
  ].freeze

  # rejects previously visited moves from #valid_moves
  def new_move_pos(pos)
    visited << parent.start_pos unless parent.nil?
    valid_moves(pos).reject { |move| visited.include?(move) }
  end

  private_constant :MOVES

  private

  attr_reader :visited

  # finds all valid moves that match with new position, and rejects any visited positions
  def valid_moves(pos)
    x, y = pos
    MOVES.each_with_object([]) do |move, acc|
      new_pos = [x + move.first, y + move.last]
      acc << new_pos if new_pos.all? { |coord| coord.between?(0, 7) }
    end
  end

  def inspect
    start_pos.to_s
  end
end
