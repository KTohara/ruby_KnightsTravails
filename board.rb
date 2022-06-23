# frozen_string_literal: true

# Board management for Knight pathing
class Board
  def find_path(start_pos, final_pos)
    @root = Knight.new(start_pos)
    # last_node = dfs_move_tree(root, final_pos)
    last_node = build_move_tree(root, final_pos)
    path = move_history(last_node)
    display_path(path.reverse)
  end

  private

  attr_reader :root

  # dfs for practice:
  # method works, but will stack overflow if node has too many calls from #new_move_pos
  def dfs_move_tree(node, target, &prc)
    prc ||= proc { |move_node| move_node.start_pos == target }
    return node if prc.call(node)

    node.new_move_pos(node.start_pos).each do |move|
      node.children << knight = Knight.new(move, node)
      result = dfs_move_tree(knight, target, &prc)
      return result unless result.nil?
    end
    nil
  end

  # constructs a tree with possible knight movement nodes
  # visits each node's children (#new_move_pos) by level-order
  # returns node if start_pos is target pos
  def build_move_tree(node, target, &prc)
    prc ||= proc { |move_node| move_node.start_pos == target }
    queue = [node]
    until queue.empty?
      current = queue.shift
      return current if prc.call(current)

      move_list = current.new_move_pos(current.start_pos)
      move_list.each { |new_pos| current.children << Knight.new(new_pos, current) }
      queue.concat(current.children)
    end
    nil
  end

  # returns a node's parent lineage
  def move_history(node)
    path = []
    until node.parent.nil?
      path << node.start_pos
      node = node.parent
    end
    path << node.start_pos
  end

  def display_path(path)
    puts "The path from #{path.first} to #{path.last} will take #{path.length - 1} moves:"
    puts path.to_s
  end
end
