require "colorized_string"

class Robot
  ROBOT_SYMBOL = "R".freeze

  attr_reader :color

  def initialize(color = :red)
    @color = color
  end

  def to_s
    ColorizedString.new(ROBOT_SYMBOL, color).to_s
  end
end
