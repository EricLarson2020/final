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
  def encrypt(message, key, date)
    a = key[0..1]
    b = key[1..2]
    c = key[2..3]
    d = key[3..4]

    square_date = (date ** 2).to_s
    a = square_date[6]
    b = squre_date[7]
    c = square_date[8]
    d = square_date[9]




  encrypted_message =  {
    :encryption => encrypted_string,
    :key => key,
    :date => date

  }



  end

# :encryption => the encrypted String
# :key => the key used for encryption as a String
# :date => the date used for encryption as a String in the form DDMMYY
