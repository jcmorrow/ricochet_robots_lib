require "benchmark"
require "byebug"
require "board"

describe Board do
  describe ".move_until_collision" do
    context "when moving right from the left edge of the board" do
      it "returns the space farthest to the right" do
        board = Board.new(2)

        expect(
          board.move_until_collision(from: [0, 0], towards: :right),
        ).to eq([1, 0])
      end
    end

    context "when moving right from the right edge of the board" do
      it "returns the space you started on" do
        board = Board.new(2)

        expect(
          board.move_until_collision(from: [1, 0], towards: :right),
        ).to eq([1, 0])
      end
    end

    context "when moving left from the left edge of the board" do
      it "returns the space you started on" do
        board = Board.new(2)

        expect(
          board.move_until_collision(from: [0, 0], towards: :left),
        ).to eq([0, 0])
      end
    end
  end

  describe ".print" do
    it "prints out the board with the robots on it!" do
      board = Board.new(2)

      expect(board.print).to eq(<<~BRD)
         _ _
        |_|_|
        |_|_|
      BRD
    end
  end
end
