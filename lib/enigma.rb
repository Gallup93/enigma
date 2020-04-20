require './lib/crypt_keeper'
class Enigma
  attr_reader :crypt

  def initialize
    @crypt = CryptKeeper.new
  end

  def encrypt(text, key=nil, date=nil)
    @crypt.encryption(text, key, date)
  end

  def decrypt(text, key, date=nil)
    @crypt.decryption(text, key, date)
  end
end
