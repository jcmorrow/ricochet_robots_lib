class ColorizedString
  COLOR_CODES = {
    blue: 34,
    green: 32,
    pink: 35,
    red: 31,
    yellow: 33,
  }.freeze
  COLORS = COLOR_CODES.keys.freeze

  def initialize(string, color)
    @color_code = COLOR_CODES[color]
    @string = string
  end

  def to_s
    "\e[#{color_code}m#{string}\e[0m"
  end

  private

  attr_reader :color_code, :string
end
