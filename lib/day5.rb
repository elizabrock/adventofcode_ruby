class Day5
  def self.run
    word_list = File.open('input/day5_input.txt', 'r').read().split("\n")
    nice_word_count = word_list.count{ |word| Day5::Part1.is_nice? word }
    puts "  According to the original rules, there are #{nice_word_count} nice words in the list"
    nice_word_count = word_list.count{ |word| Day5::Part2.is_nice? word }
    puts "  According to the new rules, there are #{nice_word_count} nice words in the list"
  end

  class Part1
    def self.is_nice? word
      vowel_count = word.chars.count{ |char| VOWELS.include? char }
      if vowel_count < 3
        return false
      end

      includes_double_letters = false
      (0..word.chars.count - 1).each do |i|
        if word[i] == word[i+1]
          includes_double_letters = true
        end
      end
      unless includes_double_letters
        return false
      end

      if DISALLOWED_STRINGS.any?{ |string| word.include? string }
        return false
      end

      true
    end

    private

    VOWELS = "aeiou"
    DISALLOWED_STRINGS = ["ab", "cd", "pq", "xy"]
  end

  class Part2
    def self.is_nice?(word)
      double_pair_present = false
      word.chars.each_cons(2) do |pair|
        if word.scan(pair.join).length > 1
          double_pair_present = true
        end
      end

      sandwich_letter_present = false
      (0..word.chars.count - 2).each do |i|
        if word[i] == word[i+2]
          sandwich_letter_present = true
        end
      end

      return double_pair_present && sandwich_letter_present
    end
  end
end
