require './lib/encrypt'
require './lib/decrypt'

class Enigma
  attr_reader :crypt1

  def initialize
    @crypt1 = Encrypt.new
    @crypt2 = Decrypt.new
  end

  def encrypt(text, key=nil, date=nil)
    @crypt1.encryption(text, key, date)
  end

  def decrypt(test, key, date=nil)
    @crypt2.decryption(test, key, date)
  end
end
