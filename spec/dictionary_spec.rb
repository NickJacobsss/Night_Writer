require './lib/dictionary'

RSpec.describe Dictionary do

  it "exists" do
    dictionary = Dictionary.new
    expect(dictionary).to be_an_instance_of(Dictionary)
  end

  it "has english keys and corresponding braille values" do
    dictionary = Dictionary.new
    expect(dictionary.english_conversion["h"]).to eq(["O.", "OO", ".."])
    expect(dictionary.english_conversion["e"]).to eq(["O.", ".O", ".."])
    expect(dictionary.english_conversion["l"]).to eq(["O.", "O.", "O."])
    expect(dictionary.english_conversion["l"]).to eq(["O.", "O.", "O."])
    expect(dictionary.english_conversion["o"]).to eq(["O.", ".O", "O."])
  end


end
