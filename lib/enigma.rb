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


  def create_shifted_key(key, date)
    # require"pry";binding.pry
    key_hash = {:a => key[0..1],
                :b => key[1..2],
                :c => key[2..3],
                :d => key[3..4]}
    # key_hash.map do |letter, number|
    #   number.to_s
    #   number.sub!(/^0/, "")
    #   number.to_i
    # end

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
            # require"pry";binding.pry
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


end

# :encryption => the encrypted String
# :key => the key used for encryption as a String
# :date => the date used for encryption as a String in the form DDMMYY
