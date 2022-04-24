require './lib/dictionary'
require './lib/translator'

RSpec.describe Translator do

  it "exists" do
    translator = Translator.new
    expect(translator).to be_an_instance_of(Translator)
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
    expect(translator.translate("ab")).to eq("O.O.\n..O.\n....\n")
  end

end
