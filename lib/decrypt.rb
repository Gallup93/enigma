require './lib/crypt_keeper'

class Decrypt
  include CryptKeeper
  attr_reader :base_characters
  def initialize
    @base_characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                        "j", "k", "l", "m", "n", "o", "p", "q", "r",
                        "s", "t", "u", "v", "w", "x", "y", "z", " "]
  end
end
