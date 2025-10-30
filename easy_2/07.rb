def each_with_object(arr, obj)
  arr.each { |ele| yield(ele, obj) }
  obj
end

# Improved After LSBot Review
def each_with_object(array, memo)
  return to_enum(__method__, array, memo) unless block_given?
  array.each { |element| yield(element, memo)}
  memo
end

p result = each_with_object([1, 3, 5], []) # => #<Enumerator: main:each_with_object([1, 3, 5], [])>

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# p result == [1, 9, 25]

# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]

# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# p result == { 1 => 1, 3 => 9, 5 => 25 }

# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# p result == {}
