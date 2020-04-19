require './lib/crypt_keeper'
class Enigma
  attr_reader :crypt

  def initialize
    @crypt = CryptKeeper.new
  end

  def encrypt(text, key=nil, date=nil)
    @crypt.encryption(text, key, date)
  end

  def decrypt(test, key, date=nil)
    @crypt.decryption(test, key, date)
  end
end
