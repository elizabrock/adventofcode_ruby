require_relative "spec_helper"

describe Day3 do
  describe Day3::Santa do
    let(:santa){ Day3::Santa.new }

    describe "#current_location" do
      it "starts out at 0, 0" do
        santa.current_location.must_equal [0, 0]
      end
    end

    describe "#total_houses_visited" do
      it "starts out at 1" do
        santa.total_houses_visited.must_equal 1
      end
    end

    describe "#travel" do
      it "can travel North" do
        santa.travel("^")
        santa.total_houses_visited.must_equal 2
        santa.current_location.must_equal [0, -1]
      end
      it "can travel East" do
        santa.travel(">")
        santa.total_houses_visited.must_equal 2
        santa.current_location.must_equal [1, 0]
      end
      it "can travel South" do
        santa.travel("v")
        santa.total_houses_visited.must_equal 2
        santa.current_location.must_equal [0, 1]
      end
      it "can travel West" do
        santa.travel("<")
        santa.total_houses_visited.must_equal 2
        santa.current_location.must_equal [-1, 0]
      end

      describe "when traveling to multiple locations" do
        before do
          santa.travel('^')
          santa.travel('>')
          santa.travel('v')
          santa.travel('<')
        end

        it "should not record double visits" do
          santa.total_houses_visited.must_equal 4
        end

        it "should record santa's current location" do
          santa.current_location.must_equal [0, 0]
        end
      end
    end
  end
end
