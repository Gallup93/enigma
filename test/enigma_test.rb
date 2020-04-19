require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma.rb'
require './lib/encrypt'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_initialization_with_attributes
    assert_instance_of Enigma, @enigma
    assert_instance_of Encrypt, @enigma.crypt1
  end

  def test_encrypt
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, @enigma.encrypt("hello world", "02715", "040895")
  end

  def test_decrypt
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end
end
