class Translator
  include Dictionary
  attr_reader :output_text

  def initialize
    @output_text = ""
  end

  def character_to_braille(input)
    eng_to_braille_hash[input]
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

  def eng_to_b_translate(input)
    if input.length <= 40
      lines_arr = [top_row(input),middle_row(input),bottom_row(input)]
      @output_text += lines_arr.map {|line| line + "\n"}.join
    else
      before_40_input = input[0..39]
      lines_arr = [top_row(before_40_input),middle_row(before_40_input),bottom_row(before_40_input)]
      @output_text += lines_arr.map {|line| line + "\n"}.join
      after_40_input = input[40..-1]
      eng_to_b_translate(after_40_input)
    end
  end

  def organize_braille_row(input)
    rows = [[],[],[]]
    counter = 0
    input.chars.each do |char|
      if char == "\n"
        counter += 1
      end
      index = counter % 3
      rows[index] << char
    end
    rows.each do |row|
      row.delete("\n")
    end
  end

  def braille_row_join_characters(input)
    counter = 0
    rows = []
    organize_braille_row(input).each do |row|
      rows[counter] = row.join.scan(/../)
      counter += 1
    end
    rows
  end

  def translate_to_eng(input)
    input_arr = braille_row_join_characters(input)
    output_arr = []
    converted_letters = ""
    until input_arr[0].count == 0 do
      input_arr.each do |index|
        output_arr << index[0]
        index.shift
      end
    converted_letters << braille_to_eng_hash[output_arr[-3..-1]]
    end
    converted_letters
  end
end
