require 'SimpleCov'
SimpleCov.start
require './lib/dictionary'

RSpec.describe Dictionary do
  include Dictionary

  it "has english keys and corresponding braille values" do
    expect(eng_to_braille_hash["h"]).to eq(["O.", "OO", ".."])
    expect(eng_to_braille_hash["e"]).to eq(["O.", ".O", ".."])
    expect(eng_to_braille_hash["l"]).to eq(["O.", "O.", "O."])
    expect(eng_to_braille_hash["l"]).to eq(["O.", "O.", "O."])
    expect(eng_to_braille_hash["o"]).to eq(["O.", ".O", "O."])
    expect(eng_to_braille_hash[" "]).to eq(["..", "..", ".."])
    expect(eng_to_braille_hash["w"]).to eq([".O", "OO", ".O"])
    expect(eng_to_braille_hash["o"]).to eq(["O.", ".O", "O."])
    expect(eng_to_braille_hash["r"]).to eq(["O.", "OO", "O."])
    expect(eng_to_braille_hash["l"]).to eq(["O.", "O.", "O."])
    expect(eng_to_braille_hash["d"]).to eq(["OO", ".O", ".."])
  end

  it "has braille keys and corresponding english values" do
    expect(braille_to_eng_hash[["O.", "OO", ".."]]).to eq("h")
    expect(eng_to_braille_hash.invert[[".O", "O.", ".."]]).to eq("i")
  end

end
