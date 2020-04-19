require './lib/crypt_keeper'

class Encrypt
  include CryptKeeper
  attr_reader :base_characters
  def initialize
    @base_characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                        "j", "k", "l", "m", "n", "o", "p", "q", "r",
                        "s", "t", "u", "v", "w", "x", "y", "z", " "]
  end

  def encryption(text, key=nil, date=nil)
    if date == nil
      time = Time.new
      date = time.strftime("%d/%m/%y").gsub(/[^0-9,.]/, "")
    end
    if key == nil
      key = rand.to_s
      key = key[2..6]
    end
    result = {encryption: text, key: key, date: date}
      keys = generate_keys(key)
      offsets = generate_offsets(date)
      shift_nums = generate_shift_nums(offsets, keys)
      shift1 = generate_shifted_alphabet(shift_nums[0])
      shift2 = generate_shifted_alphabet(shift_nums[1])
      shift3 = generate_shifted_alphabet(shift_nums[2])
      shift4 = generate_shifted_alphabet(shift_nums[3])
      result[:encryption] = shift_text(text, shift1, shift2, shift3, shift4)
      result

  end#encrypt
end
