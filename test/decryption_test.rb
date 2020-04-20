require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/decryption'

class DecryptionTest < MiniTest::Test

  def test_it_exists
    decryption = Decryption.new
    assert_instance_of Decryption, decryption
  end

  def test_it_has_an_alphabet
    decryption = Decryption.new
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
    assert_equal expected, decryption.alphabet_hash
  end

  def test_convert_to_numbers
    decryption = Decryption.new
    expected = [10, 4, 3, 4, 17, 26, 14, 7, 20, 11, 22]
    assert_equal expected, decryption.convert_to_numbers("keder ohulw")
  end

  def test_random_key
    decryption = Decryption.new
    decryption.stubs(:rand).returns(5)
    assert_equal "55555", decryption.random_key
  end

  def test_it_can_create_shifted_key
    decryption = Decryption.new
    expected = {
      :a => 3,
      :b => 27,
      :c => 73,
      :d => 20
    }
    decryption.stubs(:random_key).returns("02715")
    assert_equal expected, decryption.create_shifted_key("02715", "040895")
    assert_equal expected, decryption.create_shifted_key("040895")
   end

   def test_it_can_unshift_coded_numbers
     decryption = Decryption.new
     key = {
       :a => 3,
       :b => 27,
       :c => 73,
       :d => 20
     }
     expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]
     unshifted_numbers = [10, 4, 3, 4, 17, 26, 14, 7, 20, 11, 22]
     assert_equal expected, decryption.unshift_numbers(unshifted_numbers, key)
   end

   def test_convert_to_letters
    decryption = Decryption.new
    message = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]
    assert_equal "hello world", decryption.decrypt_to_letters(message)
   end

   def test_it_can_decrypt
     decryption = Decryption.new
     expected =    {
      decryption: "hello world",
      key: "02715",
      date: "040895"
    }
     assert_equal expected, decryption.decrypt("keder ohulw", "02715", "040895")
   end




end
