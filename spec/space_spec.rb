require "space"

describe Space do
  it "has a coordinate system" do
    space = Space.new(1, 2)

    expect(space.x).to eq(1)
    expect(space.y).to eq(2)
  end

  describe "#position" do
    it "returns both coordinates in an array" do
      space = Space.new(1, 2)

      expect(space.position).to eq([1, 2])
    end
  end
end
