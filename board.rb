require "space"
require "board_printer"

class Board
  DEFAULT_SIZE = 16
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

    generate_walls
  end

  def generate_walls
    x = (0..15).to_a.shuffle
    y = (0..15).to_a.shuffle

    coords = x.zip(y)

    coords.each do |wall|
      spaces[wall[0]][wall[1]].occupant = Wall.new
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
    BoardPrinter.print(spaces)
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
