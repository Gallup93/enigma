class Crypt
  attr_reader :base_characters
  def initialize
    @base_characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                        "j", "k", "l", "m", "n", "o", "p", "q", "r",
                        "s", "t", "u", "v", "w", "x", "y", "z", " "]
  end

  def generate_offsets(date=nil)
    if date == nil
      time = Time.new
      date = time.strftime("%d/%m/%y").gsub(/[^0-9,.]/, "")
    end
    squared = (date.to_i * date.to_i)
    squared.digits.first(4).reverse.compact
  end

  def generate_keys(key=nil)
    if key == nil
      key = rand.to_s
      key = key[2..6]
    end
    keys = []
    keys << (key[0] + key[1]).to_i
    keys << (key[1] + key[2]).to_i
    keys << (key[2] + key[3]).to_i
    keys << (key[3] + key[4]).to_i
    keys
  end

  def generate_shift_nums(offsets, keys)
    shift = []
    count = 0
    offsets.each do |offset|
      shift << offset += keys[count]
      count += 1
    end
    shift
  end

  def generate_shifted_alphabet(shift_num)
    result = {"a" => nil, "b" => nil, "c" => nil, "d" => nil, "e" => nil,
    "f" => nil, "g" => nil, "h" => nil, "i" => nil, "j" => nil, "k" => nil,
    "l" => nil, "m" => nil, "n" => nil, "o" => nil, "p" => nil, "q" => nil,
    "r" => nil, "s" => nil, "t" => nil, "u" => nil, "v" => nil, "w" => nil,
    "x" => nil, "y" => nil, "z" => nil, " " => nil}

    shifted = @base_characters.rotate(shift_num)
    count = 0

    @base_characters.each do |char|
      result[char] = shifted[count]
      count += 1
    end
    result
  end

  def shift_text(text, shift1, shift2, shift3, shift4)
    count = 0
    type = :one
    encrypted = text.chars

    while count < text.length do
      if type == :one
        encrypted[count] = shift1[encrypted[count]]
        count +=1
        type = :two
      elsif type == :two
        encrypted[count] = shift2[encrypted[count]]
        count +=1
        type = :three
      elsif type == :three
        encrypted[count] = shift3[encrypted[count]]
        count +=1
        type = :four
      else
        encrypted[count] = shift4[encrypted[count]]
        count +=1
        type = :one
      end
    end
    text = ""
    encrypted.each do |letter|
      text += letter
    end
    text
  end

  def encrypt(text, key=nil, date=nil)
    result = {encryption: text, key: key, date: date}
    if key != nil && date != nil
      keys = generate_keys(key)
      offsets = generate_offsets(date)
      shift_nums = generate_shift_nums(offsets, keys)
      shift1 = generate_shifted_alphabet(shift_nums[0])
      shift2 = generate_shifted_alphabet(shift_nums[1])
      shift3 = generate_shifted_alphabet(shift_nums[2])
      shift4 = generate_shifted_alphabet(shift_nums[3])
      result[:encryption] = shift_text(text, shift1, shift2, shift3, shift4)
      result
    end#if
  end#encrypt
end
