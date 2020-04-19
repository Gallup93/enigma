require './lib/enigma'
require './lib/file_work'
enigma = Enigma.new
file_work = FileWork.new
file_paths = ARGV
text = file_work.get_text('./files/uncrypted_test.txt')
enigma.encrypt(text)
