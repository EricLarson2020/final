require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/encrypt'

class EncryptTest < MiniTest::Test

  def test_it_exists
    encryption = Encrypt.new
    assert_instance_of Encrypt, encryption
  end
