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
    @starting_pos = starting_pos
    @visited_positions = [starting_pos]
  end

  def new_move_positions(pos)
    new_move_positions = self.valid_moves(pos)
    new_move_positions.reject!{|pos| @visited_positions.include?(pos)}

    @visited_positions += new_move_positions
    new_move_positions
  end
end
