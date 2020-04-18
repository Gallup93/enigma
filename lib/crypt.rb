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
end
