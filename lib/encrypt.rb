require './lib/enigma'
require './lib/file_work'

enigma = Enigma.new
file_work = FileWork.new

#fnkd = file names + key + date
fnkd = ARGV
text = file_work.get_text(file_work.create_file_path(fnkd[0]))
crypt = enigma.encrypt(text, fnkd[2], fnkd[3])
text = crypt[:encryption]
file_work.write_text((file_work.create_file_path(fnkd[1])), text)

puts "Created '#{fnkd[1]}' with the key #{crypt[:key]} and date #{crypt[:date]}"
