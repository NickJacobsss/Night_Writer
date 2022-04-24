require './lib/dictionary'

RSpec.describe Dictionary do
  include Dictionary

  it "has english keys and corresponding braille values" do
    expect(eng_to_braille_hash["h"]).to eq(["O.", "OO", ".."])
    expect(eng_to_braille_hash["e"]).to eq(["O.", ".O", ".."])
    expect(eng_to_braille_hash["l"]).to eq(["O.", "O.", "O."])
    expect(eng_to_braille_hash["l"]).to eq(["O.", "O.", "O."])
    expect(eng_to_braille_hash["o"]).to eq(["O.", ".O", "O."])
  end

end
