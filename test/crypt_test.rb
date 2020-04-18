require 'minitest/autorun'
require 'minitest/pride'
require './lib/crypt.rb'

class CryptTest < Minitest::Test
  def setup
    @crypt = Crypt.new
  end

  def test_initialization_with_attributes
    base_characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                        "j", "k", "l", "m", "n", "o", "p", "q", "r",
                        "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_instance_of Crypt, @crypt
    assert_equal base_characters, @crypt.base_characters
  end

  def test_current_date_as_int
    date = @crypt.current_date_as_int
    assert_equal true, date.to_s.length == 5 || date.to_s.length == 6
  end
end
