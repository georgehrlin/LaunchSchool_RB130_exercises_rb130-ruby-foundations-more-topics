def count(collection)
  counter = 0
  collection.each { |element| counter += 1 if yield(element) }
  counter
end

# Further Exploration
def count(collection)
  counter = 0
  0.upto(collection.length - 1) do |index|
    counter += 1 if yield(collection[index])
  end
  counter
end

# The following two solutions are inspired by their respective authors in the
# See Community Solutions section. I did not read the detailed implementations
# of the original posted solutions. I went ahead and tried to solve using their
# main ideas myself, without knowing how they are implemented

# Using #reduce, inspired by E-Lynn Yap
def count(collection)
  collection.reduce(0) { |sum, n| yield(n) ? sum + 1 : sum }
end

# Using recursion, inspired by Brenno Kaneyasu
def count(collection, counter=0, index=0, &block)
  return counter if index >= collection.length
  counter += 1 if block.call(collection[index])
  index += 1
  count(collection, counter, index, &block)
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
