class Enigma
  attr_reader :alphabet
  def initialize
    @alphabet = ("a".."z").to_a << " "

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

Consider the date formatted as a number, DDMMYY. If the date is August 4, 1995, it would be represented as 040895.
Square the numeric form (1672401025)
Take the last four digits (1025)
A offset: The first digit (1)
B offset: The second digit (0)
C offset: The third digit (2)
D offset: The fourth digit (5)

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





end
