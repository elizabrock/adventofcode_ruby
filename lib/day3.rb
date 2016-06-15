class Day3
  def self.run
    directions = File.open('input/day3_input.txt', 'r').read()
    santa = Santa.new()
    directions.each_char do |direction|
      santa.travel(direction)
    end
    puts "  Santa will visit #{santa.total_houses_visited} houses."
  end

  class Santa
    attr_reader :current_location

    def initialize
      @locations_visited = [ ]
      @current_x = 0
      @current_y = 0
      @locations_visited << current_location
    end

    def current_location
      [@current_x, @current_y]
    end

    def total_houses_visited
      @locations_visited.uniq.count
    end

    def travel(direction)
      case direction
      when '^'
        @current_y -= 1
      when '>'
        @current_x += 1
      when 'v'
        @current_y += 1
      when '<'
        @current_x -= 1
      end
      @locations_visited << current_location
    end
  end
end
