require "space"

class Board
  DEFAULT_SIZE = 10
  MOVEMENT_CHANGE_SETS = {
    down: [0, -1].freeze,
    left: [-1, 0].freeze,
    right: [1, 0].freeze,
    up: [0, 1].freeze,
  }.freeze

  def initialize(size = DEFAULT_SIZE)
    @size = size
    @spaces = Array.new(size) do |x|
      Array.new(size) do |y|
        Space.new(x, y, occupant: nil)
      end
    end
  end

  def move_until_collision(from:, towards:)
    space = spaces[from.first][from.last]
    next_space = move_one(from, towards)
    until next_space.occupied?
      space = next_space
      next_space = move_one(space.position, towards)
    end
    space.position
  end

  def print
    board_string = " _" * size
    spaces.each do |row|
      board_string << "\n"
      row.each do |space|
        board_string << "|#{space}"
      end
      board_string << "|"
    end
    board_string << "\n"
  end

  private

  attr_reader :size, :spaces

  def max_i
    size - 1
  end

  def move_one(from, towards)
    new_position = from.
      zip(MOVEMENT_CHANGE_SETS[towards]).
      map { |coords| coords.reduce(:+) }
    if new_position.detect { |position| position.negative? || position > max_i }
      OutOfBoundsSpace.new
    else
      spaces[new_position.first][new_position.last]
    end
  end
end

class OutOfBoundsSpace < Space
  def initialize; end

  def occupied?
    true
  end
end
