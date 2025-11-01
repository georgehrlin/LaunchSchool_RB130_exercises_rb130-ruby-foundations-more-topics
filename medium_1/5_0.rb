items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

# 1
gather(items) do |*first_three, last|
  puts first_three.join(', ')
  puts last
end

puts

# 2
gather(items) do |first, *middle_two, last|
  puts first
  puts middle_two.join(', ')
  puts last
end

puts

# 3
gather(items) do |first, *last_three|
  puts first
  puts last_three.join(', ')
end

puts

# 4
gather(items) do |first, second, third, last|
  # puts [first, second, third, last].join(', ') # Wrong
  puts "#{first}, #{second}, #{third}, and #{last}" # Correction
end

# Test
gather(items) do |first, second|
  puts first
  puts second
end
# Output:
# apples
# corn
