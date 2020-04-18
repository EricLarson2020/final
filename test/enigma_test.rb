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

  def test_it_can_encrypt

    enigma = Enigma.new

  expected= {
            encryption: "keder ohulw",
            key: "02715",
            date: "040895"
  }
    assert_equal expected, enigma.encrypt("hello world", "02715", "040895")

  end

end
