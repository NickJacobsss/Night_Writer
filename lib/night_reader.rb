require './lib/dictionary'
require './lib/translator'

translator = Translator.new
read_file = File.open(ARGV[0], "r")
write_file = File.open(ARGV[1], "w")

braille_text = read_file.read
# require'pry';binding.pry

eng_text = translator.translate_to_eng(braille_text)

write_file.write(eng_text)
write_file.close

puts "Created #{ARGV[1]} containing #{braille_text.length - 1} characters"
