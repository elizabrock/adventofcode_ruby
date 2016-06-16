require_relative "spec_helper"

describe Day4 do
  describe "find_hash_salt_for_key" do
    it "should find the correct output for abcdef" do
      input = "abcdef"
      expected = 609043
      actual = Day4.find_hash_salt_for_key(input)
      actual.must_equal expected
    end
    it "should find the correct output for pqrstuv" do
      input = "pqrstuv"
      expected = 1048970
      actual = Day4.find_hash_salt_for_key(input)
      actual.must_equal expected
    end
  end
end
