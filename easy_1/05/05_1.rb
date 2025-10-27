# Second Solution (Refractored First Solution)
ALPHABET_UPPER = ('A'..'Z').to_a
ALPHABET_LOWER = ('a'..'z').to_a
SHIFT = 13
ALPHABET_SIZE = 26

def convert_idx(idx_old)
  idx_new = idx_old + SHIFT
  idx_new < ALPHABET_SIZE ? idx_new : idx_new % SHIFT
end

def decipher(letter)
  if ALPHABET_UPPER.include?(letter)
    idx_old = ALPHABET_UPPER.index(letter)
    ALPHABET_UPPER[convert_idx(idx_old)]
  elsif ALPHABET_LOWER.include?(letter)
    idx_old = ALPHABET_LOWER.index(letter)
    ALPHABET_LOWER[convert_idx(idx_old)]
  else
    letter
  end
end

arr_names = File.readlines('names.txt', chomp: true)

arr_names.each do |name|
  result = ''
  name.chars.each { |char| result << decipher(char) }
  puts result
end
