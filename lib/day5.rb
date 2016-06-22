class Day5
  def self.run
    word_list = File.open('input/day5_input.txt', 'r').read().split("\n")
    nice_word_count = word_list.count{ |word| Day5.is_nice? word }
    puts "  There are #{nice_word_count} nice words in the list"
  end

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
