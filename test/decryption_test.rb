require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/decryption'

class DecryptionTest < MiniTest::Test

  def test_it_exists
    decryption = Decryption.new
  end
end
