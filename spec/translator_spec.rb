require 'SimpleCov'
SimpleCov.start
require './lib/dictionary'
require './lib/translator'

RSpec.describe Translator do

  it "exists" do
    translator = Translator.new
    expect(translator).to be_an_instance_of(Translator)
  end

  it "has readable attributes" do
    translator = Translator.new
    expect(translator.output_text).to eq("")
  end

  it "can take a letter and convert to braille" do
    translator = Translator.new
    expect(translator.character_to_braille("a")).to eq(["O.", "..", ".."])
  end

  it "can get input and splitting into array of characters" do
    translator = Translator.new
    expect(translator.text_convert("ab")).to eq([["O.", "..", ".."], ["O.", "O.", ".."]])
  end

  it "can split english letters into top row braille only" do
    translator = Translator.new
    expect(translator.top_row("ab")).to eq("O.O.")
  end

  it "can split english letters into middle row braille only" do
    translator = Translator.new
    expect(translator.middle_row("ab")).to eq("..O.")
  end

  it "can split english letters into bottom row braille only" do
    translator = Translator.new
    expect(translator.bottom_row("ab")).to eq("....")
  end

  it "can print out input in 3 rows" do
    translator = Translator.new
    expect(translator.eng_to_b_translate("ab")).to eq("O.O.\n..O.\n....\n")
    expect(translator.eng_to_b_translate("hi my name is nick and this is over fourty characters").length).to eq(339)
  end

  it "can read braille array and output english character" do
    translator = Translator.new
    expect(translator.character_to_eng(["O.", "OO", ".."])).to eq("h")
  end

  it "can split braille text into array of rows" do
    translator = Translator.new
    expect(translator.split_braille_row("O.O.\nO.O.\n.O.O")).to eq([["O", ".","O", "."], ["O", ".","O", "."], [".", "O",".", "O"]])
  end

  it "can join split characters into groups of 2 per row " do
    translator = Translator.new
    expect(translator.row_join_characters("O.O.\nO.O.\n....")).to eq([["O.", "O."], ["O.", "O."], ["..", ".."]])
  end

  it "can output english letters " do
    translator = Translator.new
    expect(translator.translate_to_eng("O.O.O.\nO.O.O.\n......")).to eq("bbb")
  end

end
