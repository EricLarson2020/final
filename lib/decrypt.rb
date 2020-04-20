require './lib/enigma'

message = File.open(ARGV[0], "r")
encrypted_message = message.read

message.close
enigma = Enigma.new


decrypted_message = enigma.decrypt(encrypted_message, "02715", "040895")

writer = File.open(ARGV[1], "w")
writer.write(decrypted_message[:decryption])
writer.close
