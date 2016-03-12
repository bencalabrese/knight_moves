require_relative '00_tree_node'
require 'byebug'
class KnightPathFinder
  DELTAS = [
    [2, 1],
    [2, -1],
    [1, 2],
    [1, -2],
    [-1, 2],
    [-1, -2],
    [-2, 1],
    [-2, -1]
  ]

  def self.valid_moves(pos)
    current_x, current_y = pos
    new_positions = DELTAS.map { |x, y| [x + current_x, y + current_y] }
    new_positions.select { |x, y| x.between?(0,7) && y.between?(0,7) }
  end

  def initialize(starting_pos)
    @visited_positions = [starting_pos]
    @root_node = PolyTreeNode.new(starting_pos)
  end

  attr_reader :root_node

  def new_move_positions(pos)
    new_move_positions = self.class.valid_moves(pos)
    new_move_positions.reject!{|pos| @visited_positions.include?(pos)}

    @visited_positions += new_move_positions
    new_move_positions
  end

  def build_move_tree
    queue = [@root_node]

    until queue.empty?
      node = queue.shift

      new_move_positions(node.value).each do |pos|
        child_node = PolyTreeNode.new(pos)
        queue << child_node
        child_node.parent = node
      end
    end
  end

  def find_path(end_pos)
    target_node = root_node.bfs(end_pos)
    path = []
    until target_node.parent.nil?
      path.unshift(target_node.value)
      target_node = target_node.parent
    end
    path.unshift(root_node.value)
  end

end
knight = KnightPathFinder.new([0,0])
knight.build_move_tree
p knight.find_path([7,6])
