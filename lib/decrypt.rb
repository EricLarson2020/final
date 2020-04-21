require './lib/enigma'

message = File.open(ARGV[0], "r")
encrypted_message = message.read

message.close
enigma = Enigma.new


decrypted_message = enigma.decrypt(encrypted_message, ARGV[2], ARGV[3])

writer = File.open(ARGV[1], "w")
writer.write(decrypted_message[:decryption])
writer.close

p "Created #{(ARGV[1])} with the key #{decrypted_message[:key]} and date #{decrypted_message[:date]}"
