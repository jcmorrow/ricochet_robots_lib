class Space
  EMPTY_SPACE_SYMBOL = "_".freeze

  attr_reader :x, :y
  attr_accessor :occupant

  def initialize(x, y, occupant: nil)
    @occupant = occupant
    @x = x
    @y = y
  end

  def occupied?
    !!occupant
  end

  def position
    [x, y]
  end

  def to_s
    occupant&.to_s || EMPTY_SPACE_SYMBOL
  end
end

class Wall
  def to_s
    "W".freeze
  end
end
