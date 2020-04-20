require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/encryption'
require'./lib/decryption'
require 'mocha/minitest'






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

  def test_random_key
    enigma = Enigma.new
    enigma.stubs(:rand).returns(5)
    assert_equal "55555", enigma.random_key
  end


  def test_encrypt
    enigma = Enigma.new
    expected= {
              encryption: "keder ohulw",
              key: "02715",
              date: "040895"
    }

    assert_equal expected, enigma.encrypt("Hello World", "02715", "040895")
    enigma.stubs(:today_date).returns("040895")
    assert_equal expected, enigma.encrypt("hello world", "02715")
    enigma.stubs(:random_key).returns("02715")
    enigma.stubs(:today_date).returns("040895")
    assert_equal expected, enigma.encrypt("hello world")
  end

  def test_today_date
    enigma = Enigma.new
    today = Date.new(2020,4,20)
    enigma.stubs(:today).returns(today)
    assert_equal "042020", enigma.today_date
  end

  def test_it_can_decrypt
    enigma = Enigma.new
    encrypted = {
              encryption: "keder ohulw",
              key: "02715",
              date: "040895"
    }

    expected =    {
     decryption: "hello world",
     key: "02715",
     date: "040895"
   }
    assert_equal expected, enigma.decrypt("keder ohulw", "02715", "040895")
    enigma.stubs(:today_date).returns("040895")
    assert_equal expected,  enigma.decrypt(encrypted[:encryption], "02715")
  end


end
