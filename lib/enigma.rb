class Enigma
  attr_reader :alphabet, :alphabet_hash
  def initialize
    @alphabet = ("a".."z").to_a << " "
    @alphabet_hash = {"a" => 0,
                      "b" => 1,
                      "c" => 2,
                      "d" => 3,
                      "e" => 4,
                      "f" => 5,
                      "g" => 6,
                      "h" => 7,
                      "i" => 8,
                      "j" => 9,
                      "k" => 10,
                      "l" => 11,
                      "m" => 12,
                      "n" => 13,
                      "o" => 14,
                      "p" => 15,
                      "q" => 16,
                      "r" => 17,
                      "s" => 18,
                      "t" => 19,
                      "u" => 20,
                      "v" => 21,
                      "w" => 22,
                      "x" => 23,
                      "y" => 24,
                      "z" => 25,
                      " " => 26}
  end

  # A: 3
  # B: 27
  # C: 73
  # D: 20
#
#   A key: first two digits (02)
# B key: second and third digits (27)
# C key: third and fourth digits (71)
# D key: fourth and fifth digits (15)

# The encrypt method takes a message String as an argument. It can optionally take a
# Key and Date as arguments to use for encryption. If the key is not included, generate
#  a random key. If the date is not included, use today’s date.

# Consider the date formatted as a number, DDMMYY. If the date is August 4, 1995, it would be represented as 040895.
# Square the numeric form (1672401025)
# Take the last four digits (1025)
# A offset: The first digit (1)
# B offset: The second digit (0)
# C offset: The third digit (2)
# D offset: The fourth digit (5)
#
  # def encrypt(message, key, date)
  #   a1 = key[0..1]
  #   b1 = key[1..2]
  #   c1 = key[2..3]
  #   d1 = key[3..4]
  #
  #   square_date = (date ** 2).to_s
  #   a2 = square_date[6]
  #   b2 = squre_date[7]
  #   c2 = square_date[8]
  #   d2 = square_date[9]
  #
  #
  #   a = a1 + a2
  #   b = b1 + b2
  #   c = c1 + c2
  #   d = d1 + d2
  #
  #
  #
  #
  # encrypted_message =  {
  #   :encryption => encrypted_string,
  #   :key => key,
  #   :date => date
  #
  # }
  def covert_to_numbers(input)


  end

  def shift_numbers(unshifted_array, key)
    unshifted_array.map.with_index do |number, index|

      if index == 0 || (index % 4 == 0)
        number + key[:a]
      elsif index == 1 || ((index - 1) % 4 == 0)
        number + key[:b]
      elsif index == 2 || ((index - 2) % 4 == 0)
        number + key[:c]
      elsif index == 3 || ((index -3) % 4 == 0)
        number + key[:d]
      end
    end
  end
end

# :encryption => the encrypted String
# :key => the key used for encryption as a String
# :date => the date used for encryption as a String in the form DDMMYY
