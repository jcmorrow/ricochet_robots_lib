class BoardPrinter
  NEWLINE = "\n".freeze
  PIPE = "|".freeze
  TOP_BORDER = " _".freeze

  def self.print(spaces)
    [
      TOP_BORDER * spaces.count,
      spaces.map do |row|
        [NEWLINE, row.map { |space| [PIPE, space.to_s].join }, PIPE].join
      end,
      NEWLINE,
    ].join
  end
end
