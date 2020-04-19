require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt.rb'
require 'mocha/minitest'

class DecryptTest < Minitest::Test
  def setup
    @decrypt = Decrypt.new
  end

  def test_initialization_with_attributes
    base_characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                        "j", "k", "l", "m", "n", "o", "p", "q", "r",
                        "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_instance_of Decrypt, @decrypt
    assert_equal base_characters, @decrypt.base_characters
  end
end
