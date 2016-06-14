require_relative "spec_helper"

describe Day1 do

  describe "destination" do
    it "scenario 1" do
      expected = 0
      actual = Day1.new("(())").destination
      actual.must_equal expected
    end

    it "scenario 2" do
      expected = 0
      actual = Day1.new("()()").destination()
      actual.must_equal expected
    end

    it "scenario 3" do
      expected = 3
      actual = Day1.new("(((").destination()
      actual.must_equal expected
    end

    it "scenario 4" do
      expected = 3
      actual = Day1.new("(()(()(").destination()
      actual.must_equal expected
    end

    it "scenario 5" do
      expected = 3
      actual = Day1.new("))(((((").destination()
      actual.must_equal expected
    end

    it "scenario 6" do
      expected = -1
      actual = Day1.new("())").destination()
      actual.must_equal expected
    end

    it "scenario 7" do
      expected = -1
      actual = Day1.new("))( ").destination()
      actual.must_equal expected
    end

    it "scenario 8" do
      expected = -3
      actual = Day1.new(")))").destination()
      actual.must_equal expected
    end

    it "scenario 9" do
      expected = -3
      actual = Day1.new(")())())").destination()
      actual.must_equal expected
    end
  end

  describe "first_enters_basement_at" do
    it "scenario 1" do
      expected = 1
      actual = Day1.new(")").first_enters_basement_at()
      actual.must_equal expected
    end

    it "scenario 2" do
      expected = 3
      actual = Day1.new("())").first_enters_basement_at()
      actual.must_equal expected
    end

    it "scenario 3" do
      expected = 5
      actual = Day1.new("()())").first_enters_basement_at()
      actual.must_equal expected
    end

    it "scenario 4" do
      expected = -1
      actual = Day1.new("()()").first_enters_basement_at()
      actual.must_equal expected
    end
  end
end
