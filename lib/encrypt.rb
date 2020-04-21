require './lib/enigma.rb'

message = File.open(ARGV[0], "r")
read_message = message.read
message.close

enigma = Enigma.new

encrypted_message = enigma.encrypt(read_message , "82648", "240818")


writer = File.open(ARGV[1], "w")
writer.write(encrypted_message[:encryption])
writer.close


p "Created #{(ARGV[1])} with the key #{encrypted_message[:key]} and date #{encrypted_message[:date]}"
