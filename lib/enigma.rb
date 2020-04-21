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

  def build_and_execute_crypt(names_key_date, type)
    nkd = names_key_date
    file_work = FileWork.new
    text = file_work.get_text(file_work.create_file_path(nkd[0]))
    if type == :encrypt
      crypt = encrypt(text, nkd[2], nkd[3])
      text = crypt[:encryption]
      file_work.write_text((file_work.create_file_path(nkd[1])), text)

      puts "Created '#{nkd[1]}' with the key #{crypt[:key]} and date #{crypt[:date]}"
      crypt
    else
      crypt = decrypt(text, nkd[2], nkd[3])
      text = crypt[:decryption]
      file_work.write_text((file_work.create_file_path(nkd[1])), text)

      puts "Created '#{nkd[1]}' with cracked key #{crypt[:key]} and date #{crypt[:date]}"
      crypt
    end

  end
end
