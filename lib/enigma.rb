class Enigma
  attr_reader :alphabet, :alphabet_hash
  def initialize
    @alphabet = ("a".."z").to_a << " "
    @alphabet_hash = {"a" => 0,
                      "b" => 1,
                      "c" => 2,
                      "d" => 3,
                      "e" => 4,
                      "f" => 5,
                      "g" => 6,
                      "h" => 7,
                      "i" => 8,
                      "j" => 9,
                      "k" => 10,
                      "l" => 11,
                      "m" => 12,
                      "n" => 13,
                      "o" => 14,
                      "p" => 15,
                      "q" => 16,
                      "r" => 17,
                      "s" => 18,
                      "t" => 19,
                      "u" => 20,
                      "v" => 21,
                      "w" => 22,
                      "x" => 23,
                      "y" => 24,
                      "z" => 25,
                      " " => 26}
  end


  def random_key
    key = (0...5).map { [rand(10)] }.join
  end


  def create_shifted_key(key = random_key, date)

    random_key = (0...5).map { [rand(10)] }.join


    key_hash = {:a => key[0..1],
                :b => key[1..2],
                :c => key[2..3],
                :d => key[3..4]}

    square_date = (date.to_i ** 2).to_s
    date_hash = {:a => square_date[-4],
                :b => square_date[-3],
                :c => square_date[-2],
                :d => square_date[-1]}

    shift = key_hash.merge!(date_hash) do |letter, key_value, date_value|
      key_value.to_i + date_value.to_i
    end
  end


  def convert_to_numbers(input)
    input_array = input.downcase.chars
    input_array.map do |letter|
      alphabet_hash[letter]
    end
  end

  def shift_numbers(unshifted_array, key)
    unshifted_array.map.with_index do |number, index|

      if index == 0 || (index % 4 == 0)
        number + key[:a]
      elsif index == 1 || ((index - 1) % 4 == 0)
        number + key[:b]
      elsif index == 2 || ((index - 2) % 4 == 0)
        number + key[:c]
      elsif index == 3 || ((index -3) % 4 == 0)
        number + key[:d]
      end
    end
  end


  def convert_to_letters(shifted_numbers)

    shifted_letters = shifted_numbers.map do |shifted_number|
      returned_letter = ""
      if shifted_number > 26
        reduced_number = shifted_number % 27
        @alphabet_hash.each do |letter, number|
          if number == reduced_number
            returned_letter = letter
          end
        end
      else
        @alphabet_hash.each do |letter, number|
          if number == shifted_number
            returned_letter = letter
          end
        end
      end
      returned_letter
    end
    shifted_letters.join
  end

  def encrypt(message, key = random_key, date)
    shift_key = create_shifted_key(key, date)
    converted_numbers = convert_to_numbers(message)
    numbers_shifted = shift_numbers(converted_numbers, shift_key)
    encryption = convert_to_letters(numbers_shifted)
    encrypted_message = {
      encryption: encryption,
      key: key,
      date: date
    }
  end

def unshift_numbers(unshifted_numbers, key)
unshifted_numbers.map.with_index do |number, index|

 if index == 0 || (index % 4 == 0)

  if key[:a] >= 27
    modulated_number = (key[:a] % 27)
    if (number - modulated_number) < 0
      remainder = (modulated_number - number)
      (27 - remainder)
    elsif (number - modulated_number > 0)
      number - modulated_number
    end
  elsif key[:a] <= 27
  if (number - key[:a]) < 0
    remainder = (key[:a] - number)
    (27 - remainder)
  elsif (number - key[:a] > 0)
    number - key[:a]
  end
end


elsif index == 1 || ((index - 1) % 4 == 0)
  if key[:b] >= 27
    modulated_number = (key[:b] % 27)
    if (number - modulated_number) < 0
      remainder = (modulated_number - number)
      (27 - remainder)
    elsif (number - modulated_number > 0)
      number - modulated_number
    end
  elsif key[:b] <= 27
  if (number - key[:b]) < 0
    remainder = (key[:b] - number)
    (27 - remainder)
  elsif (number - key[:b] > 0)
    number - key[:b]
  end
end


elsif index == 2 || ((index - 2) % 4 == 0)

  if key[:c] >= 27
    modulated_number = (key[:c] % 27)
    if (number - modulated_number) < 0
      remainder = (modulated_number - number)
      (27 - remainder)
    elsif (number - modulated_number > 0)
      number - modulated_number
    end
  elsif key[:c] <=27
  if (number - key[:c]) < 0
    remainder = (key[:c] - number)
    (27 - remainder)
  elsif (number - key[:c] > 0)
    number - key[:c]
  end
end


  elsif index == 3 || ((index -3) % 4 == 0)
    if key[:d] >= 27
      modulated_number = (key[:d] % 27)
      if (number - modulated_number) < 0
        remainder = (modulated_number - number)
        (27 - remainder)
      elsif (number - modulated_number > 0)
        number - modulated_number
      end
    elsif key[:d] <= 27
    if (number - key[:d]) < 0
      remainder = (key[:d] - number)
      (27 - remainder)
    elsif (number - key[:d] > 0)
      number - key[:d]
    end
  end
end
end
end

  def decrypt_to_letters(message)
    letter_message = []
    message.each do |number|
      alphabet_hash.each do |key, value|
        if value == number
          letter_message <<  key
        end
      end
    end
    letter_message.join
  end

  def decrypt(message, key, date)
  number_message = convert_to_numbers(message)
  encrypted_key = create_shifted_key(key, date)
  new_numbers = unshift_numbers(number_message, encrypted_key)
  decrypted_message = decrypt_to_letters(new_numbers)
  {
    decryption: decrypted_message,
    key: key,
    date: date
  }
  end









end
