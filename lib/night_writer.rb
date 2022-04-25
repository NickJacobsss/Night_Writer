require './lib/dictionary'
require './lib/translator'

translator = Translator.new
read_file = File.open(ARGV[0], "r")
write_file = File.open(ARGV[1], "w")

eng_text = read_file.read
braille_text = translator.eng_to_b_translate(eng_text.downcase)

write_file.write(braille_text)
write_file.close

puts "Created #{ARGV[1]} containing #{eng_text.length - 1} characters"
