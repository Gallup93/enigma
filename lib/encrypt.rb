require './lib/enigma'
require './lib/file_work'
enigma = Enigma.new
file_work = FileWork.new
file_paths = ARGV
path = './files/' + file_paths[0]
text = file_work.get_text(path)
encryption = enigma.encrypt(text)

path = './files/' + file_paths[1]
file_work.write_text(path, encryption[:encryption])
puts "Created '#{file_paths[1]}' with the key #{encryption[:key]} and date #{encryption[:date]}"
