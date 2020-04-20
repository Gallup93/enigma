require './test/test_helper'

class EnigmaTest < Minitest::Test
  def setup
    @enigma = Enigma.new
  end

  def test_initialization_with_attributes
    assert_instance_of Enigma, @enigma
    assert_instance_of CryptKeeper, @enigma.crypt
  end

  def test_encrypt
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, @enigma.encrypt("Hello World", "02715", "040895")
    expected = {encryption: "keder ohulw!", key: "02715", date: "040895"}
    assert_equal expected, @enigma.encrypt("Hello World!", "02715", "040895")
  end

  def test_decrypt
    expected = {decryption: "hello world", key: "02715", date: "040895"}
    assert_equal expected, @enigma.decrypt("keder ohulw", "02715", "040895")
  end

  def test_crypts_use_default_values
    #need to stub date
    expcted1 = {:encryption=>"qddtmhqphfvtz", :key=>"02715", :date=>"200420"}
    expected2 = {:decryption=>"i need a beer", :key=>"02715", :date=>"200420"}
    encrypted = @enigma.encrypt("i need a beer", "02715")
    decrypted = @enigma.decrypt(encrypted[:encryption], "02715")
    assert_equal expcted1, encrypted
    assert_equal expected2, decrypted
  end
end
