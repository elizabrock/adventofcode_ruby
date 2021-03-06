require_relative "spec_helper"

describe Day5 do
  describe Day5::Part1 do
    describe ".is_nice?" do
      describe "with  at least three vowels, a double letter, and no disallowed substrings" do
        it "is true" do
          Day5::Part1.is_nice?("ugknbfddgicrmopn").must_equal true
        end
      end
      describe "that follows all the rules, with different rule letters overlapping" do
        it "is true" do
          Day5::Part1.is_nice?("aaa").must_equal true
        end
      end
      describe "that has no double letters" do
        it "is false" do
          Day5::Part1.is_nice?("jchzalrnumimnmhp").must_equal false
        end
      end
      describe "that contains disallowed string, ab" do
        it "is false" do
          Day5::Part1.is_nice?("haegwjzuvuyypabu").must_equal false
        end
      end
      describe "that contains disallowed string, cd" do
        it "is false" do
          Day5::Part1.is_nice?("haegwjzuvuyypcdu").must_equal false
        end
      end
      describe "that contains disallowed string, pq" do
        it "is false" do
          Day5::Part1.is_nice?("haegwjzuvuyyppqu").must_equal false
        end
      end
      describe "that contains disallowed string, xy" do
        it "is false" do
          Day5::Part1.is_nice?("haegwjzuvuyypxyu").must_equal false
        end
      end
      describe "that has no vowels" do
        it "is false" do
          Day5::Part1.is_nice?("dvszwmrrgswjxmb").must_equal false
        end
      end
      describe "that has only one vowel" do
        it "is false" do
          Day5::Part1.is_nice?("dvszwmarrgswjxmb").must_equal false
        end
      end
      describe "that has only two vowels" do
        it "is false" do
          Day5::Part1.is_nice?("dvszwmarrgswjxmib").must_equal false
        end
      end
    end
  end

  describe Day5::Part2 do
    describe ".is_nice?" do
      describe "with a pair that appears twice, and a letter that makes a sandwich" do
        it "is true" do
          Day5::Part2.is_nice?("qjhvhtzxzqqjkmpb").must_equal true
        end
      end
      describe "the follows all the rules, with different rule letters overlapping" do
        it "is true" do
          Day5::Part2.is_nice?("xxyxx").must_equal true
        end
      end
      describe "that has no sandwich letter" do
        it "is false" do
          Day5::Part2.is_nice?("uurcxstgmygtbstg").must_equal false
        end
      end
      describe "that has no double pair" do
        it "is false" do
          Day5::Part2.is_nice?("ieodomkazucvgmuy").must_equal false
        end
      end
    end
  end
end
