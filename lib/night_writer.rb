read_file = File.open(ARGV[0], "r")

english_text = read_file.read

read_file.close

puts english_text

braille_text = english_text.upcase

write_file = File.open(ARGV[1], "w")

write_file.write(braille_text)

write_file.close

puts "Created 'braille.txt' containing #{english_text.length} characters"


# english = File.open(ARGV[0],"r")
# read_english = english.read
# braille = File.open(ARGV[1],"w")
