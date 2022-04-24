class Dictionary
  attr_reader :eng_to_braille_hash,:output_text

  def initialize
    @eng_to_braille_hash = eng_to_braille_hash
    @output_text = ""
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
    input.chars.map {|char| character_to_braille(char)}.compact
  end

  def top_row(input)
    top_row = text_convert(input).map {|letter| letter[0]}.join
  end

  def middle_row(input)
    text_convert(input).map {|letter| letter[1]}.join
  end

  def bottom_row(input)
    text_convert(input).map {|letter| letter[2]}.join
  end

  def translate(input)
    if input.length <= 40
      lines_arr = [top_row(input),middle_row(input),bottom_row(input)]
      @output_text += lines_arr.map {|line| line + "\n"}.join
    else
      before_40_input = input[0..39]
      lines_arr = [top_row(before_40_input),middle_row(before_40_input),bottom_row(before_40_input)]
      @output_text += lines_arr.map {|line| line + "\n"}.join
      after_40_input = input[40..-1]
      translate(after_40_input)
    end
  end
end
