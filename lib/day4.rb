require 'digest'

class Day4
  def self.run
    result = Day4.find_hash_salt_for_key('yzbqklnj')
    puts "The hash salt for part 1 is #{result}"
  end

  def self.find_hash_salt_for_key(key)
    leading_zeros = '0' * 5
    salt = 0
    result = ''
    until result.start_with?(leading_zeros) do
      salt += 1
      result = Digest::MD5.hexdigest("#{key}#{salt}")
    end
    return salt
  end
end
