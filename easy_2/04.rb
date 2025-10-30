def count(*args)
  args.reduce(0) { |counter, element| yield(element) ? counter + 1 : counter }
end

# Improved Afte LSBot Reivew
def count(*args)
  raise ArgumentError, 'no block is given' unless block_given?
  args.reduce(0) { |count, element| count + (yield(element) ? 1 : 0) }
end

# Enumerable#count returns the number of elements in the receiver collection
def count(*args)
  return args.length unless block_given?
  args.reduce(0) { |count, element| count + (yield(element) ? 1 : 0) }
end

p count(1, 3, 6)

# Official Solution
def count(*arguments)
  total = 0
  arguments.each { |item| total += 1 if yield(item) }
  total
end
