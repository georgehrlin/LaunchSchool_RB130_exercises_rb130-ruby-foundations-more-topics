# First Solution
text = File.open('names.txt')

ALPHABET_LOWERCASE = Hash.new

('a'..'z').each_with_index do |letter, index|
  ALPHABET_LOWERCASE[index] = letter
end

ALPHABET_UPPERCASE = Hash.new

('A'..'Z').each_with_index do |letter, index|
  ALPHABET_UPPERCASE[index] = letter
end

def decipher(letter)
  if ('A'..'Z').include?(letter)
    i_original = ALPHABET_UPPERCASE.key(letter)
    idx_converted = (i_original <= 12) ? (i_original + 13) : ((i_original + 13)) % 13
    ALPHABET_UPPERCASE[idx_converted]
  elsif ('a'..'z').include?(letter)
    i_original = ALPHABET_LOWERCASE.key(letter)
    idx_converted = (i_original <= 12) ? (i_original + 13) : (i_original + 13) % 13
    ALPHABET_LOWERCASE[idx_converted]
  else
    ' '
  end
end

arr_names = text.read.split("\n")

arr_names.each do |name|
  result = []
  name.chars.each do |char|
    result << decipher(char)
  end
  puts result.join
end
