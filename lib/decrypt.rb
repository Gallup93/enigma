require './lib/enigma'
require './lib/file_work'

enigma = Enigma.new
file_work = FileWork.new
paths_key_date = ARGV

#read in file
path = './files/' + paths_key_date[0]
text = file_work.get_text(path)
decryption = enigma.decrypt(text, paths_key_date[2], paths_key_date[3])
#write out file
path = './files/' + paths_key_date[1]
file_work.write_text(path, decryption[:decryption])
puts "Created '#{paths_key_date[1]}' with the cracked key #{decryption[:key]} and date #{decryption[:date]}"
