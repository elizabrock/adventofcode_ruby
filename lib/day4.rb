require 'digest'

class Day4
  def self.run
    result = Day4.find_hash_salt_for_key('yzbqklnj', leading_zeroes: 5)
    puts "  The hash salt for part 1 is #{result}"
    result = Day4.find_hash_salt_for_key('yzbqklnj', leading_zeroes: 6)
    puts "  The hash salt for part 2 is #{result}"
  end

  def self.find_hash_salt_for_key(key, leading_zeroes: 5)
    leading_zeroes = '0' * leading_zeroes
    salt = 0
    result = ''
    until result.start_with?(leading_zeroes) do
      salt += 1
      result = Digest::MD5.hexdigest("#{key}#{salt}")
    end
    return salt
  end
end
