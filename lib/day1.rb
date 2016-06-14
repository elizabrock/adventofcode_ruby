class Day1
  def initialize(path)
    @path = path
  end

  def destination
    floors_up = @path.count("(")
    floors_down = @path.count(")")
    floors_up - floors_down
  end

  def self.run
    advent_code = File.open('input/day1_input.txt', 'r').read()
    santa_floor = Day1.new(advent_code).destination
    puts "Santa ends up on floor #{santa_floor}."
  end
end
