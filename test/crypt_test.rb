require 'minitest/autorun'
require 'minitest/pride'
require './lib/crypt.rb'

class CryptTest < Minitest::Test
  def setup
    @crypt = Crypt.new
  end

  def test_initialization_with_attributes
    assert_instance_of Crypt, @crypt
  end
end
