require_relative "spec_helper"

describe Day2  do

  describe Day2::PresentCollection do

    describe "#wrapping_paper_required" do
      it "handles scenario 1" do
        input = "2x3x4\n1x1x10"
        expected = 101
        actual = Day2::PresentCollection.new(input).wrapping_paper_required
        actual.must_equal expected
      end

      it "handles scenario 2" do
        input = "2x3x4\n1x1x10\n2x3x4\n1x1x10"
        expected = 202
        actual = Day2::PresentCollection.new(input).wrapping_paper_required
        actual.must_equal expected
      end
    end

    describe "#ribbon_required" do
      it "handles scenario 1" do
        input = "2x3x4\n1x1x10"
        expected = 48
        actual = Day2::PresentCollection.new(input).ribbon_required
        actual.must_equal expected
      end

      it "handles scenario 2" do
        input = "2x3x4\n1x1x10\n2x3x4\n1x1x10"
        expected = 96
        actual = Day2::PresentCollection.new(input).ribbon_required
        actual.must_equal expected
      end
    end
  end

  describe Day2::Present do

    let(:zero_present){ Day2::Present.new(0, 0, 0) }
    let(:rectangle1){ Day2::Present.new(2, 3, 4) }
    let(:rectangle2){ Day2::Present.new(1, 1, 10) }

    describe "#wrapping_paper_required" do
      it "handles zeros" do
        expected = 0
        actual = zero_present.wrapping_paper_required
        actual.must_equal expected
      end

      it "handles rectangle1" do
        expected = 58
        actual = rectangle1.wrapping_paper_required
        actual.must_equal expected
      end

      it "handles rectangle2" do
        expected = 43
        actual = rectangle2.wrapping_paper_required
        actual.must_equal expected
      end
    end

    describe "#ribbon_required" do
      it "handles zeroes present" do
        expected = 0
        actual = zero_present.ribbon_required
        actual.must_equal expected
      end

      it "handles rectangle1" do
        expected = 34
        actual = rectangle1.ribbon_required
        actual.must_equal expected
      end

      it "handles rectangle2" do
        expected = 14
        actual = rectangle2.ribbon_required
        actual.must_equal expected
      end
    end

    describe "#volume" do
      it "handles zeros" do
        expected = 0
        actual = zero_present.volume
        actual.must_equal expected
      end

      it "handles rectangle1" do
        expected = 24
        actual = rectangle1.volume
        actual.must_equal expected
      end

      it "handles rectangle2" do
        expected = 10
        actual = rectangle2.volume
        actual.must_equal expected
      end
    end
  end
end
