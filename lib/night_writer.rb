require './lib/dictionary'

dictionary = Dictionary.new

read_file = File.open(ARGV[0], "r")
write_file = File.open(ARGV[1], "w")

eng_text = read_file.read
braille_text = dictionary.translate(eng_text)

write_file.write(braille_text)
write_file.close

puts "Created #{ARGV[1]} containing #{eng_text.length - 1} characters"


# english = File.open(ARGV[0],"r")
# read_english = english.read.chomp
# braille = File.open(ARGV[1],"w")
# translate = Translate.new(read_english, braille)
# require 'pry';binding.pry
