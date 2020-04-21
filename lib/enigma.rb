require './lib/decryption'
require './lib/encryption'
require 'date'


class Enigma
  attr_reader :alphabet, :alphabet_hash
  def initialize
    @encryption = Encryption.new
    @decryption = Decryption.new
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

  def today_date
    (Date.today).strftime("%m%d%y")
  end

  def random_key
    key = (0...5).map { [rand(10)] }.join
  end


  def encrypt(message, key = random_key, date = today_date)
    @encryption.encrypt(message, key, date)
  end



  def decrypt(message, key = random_key, date = today_date)
    @decryption.decrypt(message, key, date)
  end




end
