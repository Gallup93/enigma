require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma.rb'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_initialization_with_attributes
    assert_instance_of Enigma, @enigma
  end
end
