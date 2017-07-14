require "robot"

describe Robot do
  describe ".new" do
    it "takes a color" do
      robot = Robot.new(:blue)

      expect(robot.to_s).to eq("\e[34mR\e[0m")
    end
  end
end
