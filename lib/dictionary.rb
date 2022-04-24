class Dictionary
  attr_reader :eng_to_braille_hash

  def initialize
    @eng_to_braille_hash = eng_to_braille_hash
  end

  def eng_to_braille_hash
    {
      "a" => ["O.", "..", ".."],
      "b" => ["O.", "O.", ".."],
      "c" => ["OO", "..", ".."],
      "d" => ["OO", ".O", ".."],
      "e" => ["O.", ".O", ".."],
      "f" => ["OO", "O.", ".."],
      "g" => ["OO", "OO", ".."],
      "h" => ["O.", "OO", ".."],
      "i" => [".O", "O.", ".."],
      "j" => [".O", "OO", ".."],
      "k" => ["O.", "..", "O."],
      "l" => ["O.", "O.", "O."],
      "m" => ["OO", "..", "O."],
      "n" => ["OO", ".O", "O."],
      "o" => ["O.", ".O", "O."],
      "p" => ["OO", "O.", "O."],
      "q" => ["OO", "OO", "O."],
      "r" => ["O.", "OO", "O."],
      "s" => [".O", "O.", "O."],
      "t" => [".O", "OO", "O."],
      "u" => ["O.", "..", "OO"],
      "v" => ["O.", "O.", "OO"],
      "w" => [".O", "OO", ".O"],
      "x" => ["OO", "..", "OO"],
      "y" => ["OO", ".O", "OO"],
      "z" => ["O.", ".O", "OO"],
      " " => ["..", "..", ".."],
    }
  end

  def character_to_braille(input)
    @eng_to_braille_hash[input]
  end

  def text_convert(input)
    input.chars.map do |char|
      character_to_braille(char)
    end.compact
  end

  def top_row(input)
    text_convert(input).map do |letter|
      letter[0]
    end.join
  end

  def middle_row(input)
    text_convert(input).map do |letter|
      letter[1]
    end.join
  end

  def bottom_row(input)
    text_convert(input).map do |letter|
      letter[2]
    end.join
  end

  def translate(input)
    lines_arr = [top_row(input),middle_row(input),bottom_row(input)]
    lines_arr.map do |line|
      line + "\n"
    end.join
  end
end
