factorials = Enumerator.new do |yielder|
  yielder << 1
  a = 1 # a is the accumulator
  b = 1 # b tracks which number's factorial we are currently on
  loop do |n|
    yielder << a # Here, << indicates that a is yielded to yielder. It sets the
    b += 1       # next value in the iteration
    a *= b
  end
end

p factorials.take(6)
p factorials.take(3)
p factorials.take(6)

# Improved after seeing Official Solution
factorials = Enumerator.new do |yielder|
  a = 1
  b = 0
  loop do
    a = b.zero? ? 1 : a * b
    yielder << a
    b += 1
  end
end

p factorials.take(6)
p factorials.take(3)
p factorials.take(6)

# This works too
factorials = Enumerator.new do |yielder|
  accumulator = 1
  current_number = 0
  loop do
    current_number += 1
    yielder.yield(accumulator)
    accumulator *= current_number
  end
end

p factorials.take(6)
p factorials.take(3)
p factorials.take(6)

# By Stu
factorials = Enumerator.new do |yielder|
  i = 0
  loop do
    yielder << ((1..i).reduce(:*) || 1)
    i += 1
  end
end

p factorials.take(6)
p factorials.take(3)
p factorials.take(6)
