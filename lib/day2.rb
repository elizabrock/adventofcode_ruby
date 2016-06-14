class Day2

  def self.run
    present_list = File.open('input/day2_input.txt', 'r').read()
    present_collection = PresentCollection.new(present_list)
    puts "  The presents will require #{present_collection.wrapping_paper_required} sq. ft. of wrapping paper."
  end

  class PresentCollection
    def initialize(input)
      @presents = []
      input.split("\n").each do |line|
        height, length, width = line.split("x").map{ |i| i.to_i }
        @presents << Present.new(height, length, width)
      end
    end

    def wrapping_paper_required
      @presents.map{ |p| p.wrapping_paper_required }.reduce(:+)
    end
  end

  class Present
    def initialize(height, length, width)
      @height = height
      @length = length
      @width = width
    end

    def wrapping_paper_required
      side_areas.inject(:+) + side_areas.min
    end

    private

    def side_areas
      [
        @length * @width,
        @length * @width,
        @width * @height,
        @width * @height,
        @height * @length,
        @height * @length
      ]
    end
  end
end
