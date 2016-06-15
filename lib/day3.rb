class Day3
  def self.run
    directions = File.open('input/day3_input.txt', 'r').read()
    router = Router.new(Santa.new)
    router.route(directions)
    puts "  Santa will visit #{router.total_houses_visited} houses."
    router = Router.new(Santa.new, Santa.new)
    router.route(directions)
    puts "  Santa and Robo-Santa combined will visit #{router.total_houses_visited} houses."
  end

  class Router
    def initialize(*travelers)
      @travelers = travelers
    end

    def route(directions)
      iterator = @travelers.cycle.each
      directions.each_char do |direction|
        current_traveler = iterator.next
        current_traveler.travel(direction)
      end
    end

    def total_houses_visited
      locations_visited = @travelers.inject([]){ |memo, t| memo.push(*t.locations_visited) }
      locations_visited.uniq.count
    end
  end

  class Santa
    attr_reader :current_location, :locations_visited

    def initialize
      @locations_visited = [ ]
      @current_x = 0
      @current_y = 0
      @locations_visited << current_location
    end

    def current_location
      [@current_x, @current_y]
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
