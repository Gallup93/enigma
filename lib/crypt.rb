class Crypt
  attr_reader :base_characters
  def initialize
    @base_characters = ["a", "b", "c", "d", "e", "f", "g", "h", "i",
                        "j", "k", "l", "m", "n", "o", "p", "q", "r",
                        "s", "t", "u", "v", "w", "x", "y", "z", " "]
  end

  def current_date_as_int
    time = Time.new
    time.strftime("%d/%m/%y").gsub(/[^0-9,.]/, "").to_i
  end

  def generate_offsets(date_as_int)
    squared = date_as_int * date_as_int
    squared.digits.first(4).reverse.compact
  end

  def generate_keys
    keys = []
    number = rand.to_s
    number = number[2..6]
    keys << (number[0] + number[1]).to_i
    keys << (number[1] + number[2]).to_i
    keys << (number[2] + number[3]).to_i
    keys << (number[3] + number[4]).to_i
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
    encrypted
  end
end
