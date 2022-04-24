require './lib/dictionary'

RSpec.describe Dictionary do

  it "exists" do
    dictionary = Dictionary.new
    expect(dictionary).to be_an_instance_of(Dictionary)
  end

  it "has english keys and corresponding braille values" do
    dictionary = Dictionary.new
    expect(dictionary.eng_to_braille_hash["h"]).to eq(["O.", "OO", ".."])
    expect(dictionary.eng_to_braille_hash["e"]).to eq(["O.", ".O", ".."])
    expect(dictionary.eng_to_braille_hash["l"]).to eq(["O.", "O.", "O."])
    expect(dictionary.eng_to_braille_hash["l"]).to eq(["O.", "O.", "O."])
    expect(dictionary.eng_to_braille_hash["o"]).to eq(["O.", ".O", "O."])
  end

  it "can take a letter and convert to braille" do
    dictionary = Dictionary.new
    expect(dictionary.character_to_braille("a")).to eq(["O.", "..", ".."])
  end

  it "can get input and splitting into array of characters" do
    dictionary = Dictionary.new
    expect(dictionary.text_convert("ab")).to eq([["O.", "..", ".."], ["O.", "O.", ".."]])
  end

  it "can split english letters into top row braille only" do
    dictionary = Dictionary.new
    expect(dictionary.top_row("ab")).to eq("O.O.")
  end

  it "can split english letters into middle row braille only" do
    dictionary = Dictionary.new
    expect(dictionary.middle_row("ab")).to eq("..O.")
  end

  it "can split english letters into bottom row braille only" do
    dictionary = Dictionary.new
    expect(dictionary.bottom_row("ab")).to eq("....")
  end

  it "can print out input in 3 rows" do
    dictionary = Dictionary.new
    expect(dictionary.translate("abababababababababababababababababababababababababababababab")).to eq("O.O.\n..O.\n....\n")
  end

end
