require './lib/enigma'
require './lib/file_work'

enigma = Enigma.new
enigma.build_and_execute_crypt(ARGV, :decrypt)
