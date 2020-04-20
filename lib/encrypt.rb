require './lib/enigma.rb'

message = File.open(ARGV[0], "r")
read_message = message.read
message.close

enigma = Enigma.new

encrypted_message = enigma.encrypt(read_message, "02715", "040895")


writer = File.open(ARGV[1], "w")
writer.write(encrypted_message[:encryption])
writer.close

decrypted_message = enigma.decrypt(encrypted_message[:encryption], "02715", "040895")
