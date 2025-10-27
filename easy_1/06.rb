# My Solution 1
def my_any?(arr)
  return false if arr.length.zero? # arr.empty? is better
  i = 0
  until i == arr.length # while i < arr.length is perhaps a bit clearer
    return true if yield(arr[i])
    i += 1
  end

  false
end

# My Solution 2
def my_any?(arr)
  return false if arr.length.zero? # arr.empty? is better
  arr.each { |n| return true if yield(n) }
  false
end

require 'set'
p my_any?([1, 3, 5, 6].to_set) { |value| value.even? } == true
p my_any?([1, 3, 5, 7].to_set) { |value| value.even? } == false
p my_any?([2, 4, 6, 8].to_set) { |value| value.odd? } == false
p my_any?([1, 3, 5, 7].to_set) { |value| value % 5 == 0 } == true
p my_any?([1, 3, 5, 7].to_set) { |value| true } == true
p my_any?([1, 3, 5, 7].to_set) { |value| false } == false
p my_any?([].to_set) { |value| true } == false

# Official Solution
def any?(collection)
  collection.each { |item| return true if yield(item) }
end

=begin
Further Exploration
My soluiont 1 does not work for hashes or sets because the method iterates over
a collection by manually setting an index number and incrementing it in each
iteration. As far as my understanding goes, values in hashes and sets are not
accessed with indices.

On ther other hand, my solution 2 works for both hashes and sets. That is
because this method uses each and both the Hash and Set classes have included
the Enumerable module.

Correction
Technically, Hash and Set classes both define each.
=end
