require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/crypt_keeper.rb'

class CryptKeeperTest < Minitest::Test
  def setup
    @crypt = CryptKeeper.new
  end

  def test_initialization_with_attributes
    base_characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                        "j", "k", "l", "m", "n", "o", "p", "q", "r",
                        "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_instance_of CryptKeeper, @crypt
    assert_equal base_characters, @crypt.base_characters
  end

  def test_generates_offsets
    date = "50193"
    assert_equal [7,2,4,9], @crypt.generate_offsets(date)
  end

  def test_generates_keys
    # key = @encrypt.generate_keys
    # assert_equal true, key.length == 4 && key.all?{|key| key != nil?}
    key = @crypt.generate_keys("34987")
    assert_equal [34,49,98,87], key
  end

  def test_generate_shift_nums
    offsets = [7,2,4,9]
    keys = [12, 23, 35, 54]
    assert_equal [19, 25, 39, 63], @crypt.generate_shift_nums(offsets, keys)
  end

  def test_generate_shifted_alphabet
    shifted = {"a"=>"e", "b"=>"f", "c"=>"g", "d"=>"h", "e"=>"i", "f"=>"j",
      "g"=>"k", "h"=>"l", "i"=>"m", "j"=>"n", "k"=>"o", "l"=>"p", "m"=>"q",
      "n"=>"r", "o"=>"s", "p"=>"t", "q"=>"u", "r"=>"v", "s"=>"w", "t"=>"x",
      "u"=>"y", "v"=>"z", "w"=>" ", "x"=>"a", "y"=>"b", "z"=>"c", " "=>"d"}
    assert_equal shifted ,@crypt.generate_shifted_alphabet(4)
  end

  def test_shift_text
    shift1 = @crypt.generate_shifted_alphabet(4)
    shift2 = @crypt.generate_shifted_alphabet(3)
    shift3 = @crypt.generate_shifted_alphabet(16)
    shift4 = @crypt.generate_shifted_alphabet(6)
    assert_equal "lhars", @crypt.shift_text("hello", shift1, shift2, shift3, shift4)
  end

  def test_encryption
    #test default values(stubs)
    expected = {encryption: "keder ohulw", key: "02715", date: "040895"}
    assert_equal expected, @crypt.encryption("hello world", "02715", "040895")
  end
end
