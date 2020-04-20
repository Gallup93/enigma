require './lib/enigma'
require './lib/file_work'

enigma = Enigma.new
file_work = FileWork.new
paths_key_date = ARGV

#read in file
path = './files/' + paths_key_date[0]
text = file_work.get_text(path)
encryption = enigma.encrypt(text, paths_key_date[2], paths_key_date[3])
#write out file
path = './files/' + paths_key_date[1]
file_work.write_text(path, encryption[:encryption])
puts "Created '#{paths_key_date[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
