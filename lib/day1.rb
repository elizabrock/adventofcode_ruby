class Day1
  def initialize(path)
    @path = path
  end

  def destination
    floors_up = @path.count("(")
    floors_down = @path.count(")")
    floors_up - floors_down
  end

  def first_enters_basement_at
    floor = 0
    up = "("
    @path.chars.each_with_index do |direction, index|
      if direction == up
        floor += 1
      else
        floor -= 1
        if floor < 0
          return index + 1
        end
      end
    end
    return -1
  end

  def self.run
    advent_code = File.open('input/day1_input.txt', 'r').read()
    day1 = Day1.new(advent_code)
    puts "  Santa ends up on floor #{day1.destination}."
    puts "  Santa first entered the basement on floor #{day1.first_enters_basement_at}."
  end
end
