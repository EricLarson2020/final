require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'





# Enigma#encrypt(message, key, date)
# The encrypt method takes a message String as an argument. It can optionally take a Key and Date as arguments to use for encryption. If the key is not included, generate a random key. If the date is not included, use today’s date.
#
# The encrypt method returns a hash with three keys:
#
# :encryption => the encrypted String
# :key => the key used for encryption as a String
# :date => the date used for encryption as a String in the form DDMMYY

class EnigmaTest < MiniTest::Test


  def test_it_exists
    enigma = Enigma.new
    assert_instance_of Enigma, enigma
  end

  def test_it_has_letter
    enigma = Enigma.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
       "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]
    assert_equal expected, enigma.alphabet
  end

  def test_alphabet_hash
    enigma = Enigma.new
    expected = ({
      "a" => 0,
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
      " " => 26
    })
    assert_equal expected, enigma.alphabet_hash
  end

  

  def test_it_can_shift_numbers
    enigma = Enigma.new
    greeting = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]
    expected = [10, 31, 84, 31, 17, 53, 95, 34, 20, 38, 76]
    key = {
      :a => 3,
      :b => 27,
      :c => 73,
      :d => 20
    }
    assert_equal expected, enigma.shift_numbers(greeting, key)
  end

  #
  # def test_it_can_encrypt
  #
  #   enigma = Enigma.new
  #
  # expected= {
  #           encryption: "keder ohulw",
  #           key: "02715",
  #           date: "040895"
  # }
  #   assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  #
  # end

end
