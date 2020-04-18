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

  def shift(offsets, keys)
    shift = []
    count = 0
    offsets.each do |offset|
      shift << offset += keys[count]
      count += 1
    end
    shift
  end
end
