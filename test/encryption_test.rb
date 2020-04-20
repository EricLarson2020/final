require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/encryption'

class EncryptTest < MiniTest::Test

  def test_it_exists
    encryption = Encryption.new
    assert_instance_of Encryption, encryption
  end

  def test_it_has_an_alphabet
    encryption = Encryption.new
    expected = {"a" => 0,
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
    assert_equal expected, encryption.alphabet_hash
  end

  def test_random_key
    encryption = Encryption.new
    encryption.stubs(:rand).returns(5)
    assert_equal "55555", encryption.random_key
  end

  def test_it_can_create_shifted_key
    encryption = Encryption.new
    expected = {
      :a => 3,
      :b => 27,
      :c => 73,
      :d => 20
    }
    encryption.stubs(:random_key).returns("02715")
    assert_equal expected, encryption.create_shifted_key("02715", "040895")
    assert_equal expected, encryption.create_shifted_key("040895")
   end

   def test_it_can_convert_to_numbers
     encryption = Encryption.new
     user_input = "Hello World"
     expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]
     assert_equal expected, encryption.convert_to_numbers(user_input)
   end


end
