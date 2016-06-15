require_relative "spec_helper"

describe Day3 do
  describe Day3::Router do
    let(:santa){ Day3::Santa.new }
    let(:robosanta){ Day3::Santa.new }

    describe "with a single visitor" do
      let(:router){ Day3::Router.new(santa) }

      it "can handle a single visit" do
        directions = '>'
        router.route(directions)
        router.total_houses_visited.must_equal 2
      end

      it "can handle several visits" do
        directions = '^>v<'
        router.route(directions)
        router.total_houses_visited.must_equal 4
      end

      it "can handle many repeat visits" do
        directions = '^v^v^v^v^v'
        router.route(directions)
        router.total_houses_visited.must_equal 2
      end
    end

    describe "with multiple visitors" do
      let(:router){ Day3::Router.new(santa, robosanta) }

      it "can handle a single visit" do
        directions = '>'
        router.route(directions)
        router.total_houses_visited.must_equal 2
      end

      it "can handle two visits" do
        directions = '^v'
        router.route(directions)
        router.total_houses_visited.must_equal 3
      end

      it "can handle several visits with repeats" do
        directions = '^>v<'
        router.route(directions)
        router.total_houses_visited.must_equal 3
      end

      it "can handle many visits" do
        directions = '^v^v^v^v^v'
        router.route(directions)
        router.total_houses_visited.must_equal 11
      end
    end
  end

  describe Day3::Santa do
    let(:santa){ Day3::Santa.new }

    describe "#current_location" do
      it "starts out at 0, 0" do
        santa.current_location.must_equal [0, 0]
      end
    end

    describe "#travel" do
      it "can travel North" do
        santa.travel("^")
        santa.current_location.must_equal [0, -1]
      end
      it "can travel East" do
        santa.travel(">")
        santa.current_location.must_equal [1, 0]
      end
      it "can travel South" do
        santa.travel("v")
        santa.current_location.must_equal [0, 1]
      end
      it "can travel West" do
        santa.travel("<")
        santa.current_location.must_equal [-1, 0]
      end
    end
  end
end
