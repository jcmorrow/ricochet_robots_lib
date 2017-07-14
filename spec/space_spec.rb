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

  describe "#occupied?" do
    it "defaults to false" do
      space = Space.new(0, 0)

      expect(space).not_to be_occupied
    end

    it "is true if the space has an occupant" do
      space = Space.new(0, 0, occupant: double("Robot"))

      expect(space).to be_occupied
    end
  end

  describe "#to_s" do
    it "defaults to _" do
      space = Space.new(0, 0)

      expect(space.to_s).to eq("_")
    end

    context "when the space is occupied" do
      it "delegates to the occupant" do
        space = Space.new(0, 0, occupant: double("Robot", to_s: "foo"))

        expect(space.to_s).to eq("foo")
      end
    end
  end
end
