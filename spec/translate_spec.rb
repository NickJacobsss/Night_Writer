require './lib/translate'
require './lib/dictionary'

RSpec.describe Translate do

  it "exists" do
    translate = Translate.new
    expect(translate).to be_an_instance_of(Translate)
  end

end
