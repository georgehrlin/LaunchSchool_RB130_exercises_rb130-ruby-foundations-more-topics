def map(collection)
  collection.each_with_object([]) do |element, result|
    result << yield(element)
  end
end

# Using #reduce
def map(collection)
  collection.reduce([]) do |accumulator, element|
    accumulator << yield(element)
  end
end

require 'set'
p map([1, 3, 6].to_set) { |value| value**2 } # == [1, 9, 36]
# p map([]) { |value| true } # == []
# p map(['a', 'b', 'c', 'd']) { |value| false } # == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } # == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } # == [[1], [1, 2, 3], [1, 2, 3, 4]]

=begin
Further Exploration
Q: Does your solution work with other collections like Hashes or Sets?
A: Both of my solutions work with hashes and sets because Hash and Set have
implemented included the module Enumerable.
=end
