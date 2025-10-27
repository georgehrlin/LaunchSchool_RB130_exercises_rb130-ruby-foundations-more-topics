def none?(collection)
  collection.each { |element| return false if yield(element) }
  true
end

# Using #select just for fun
def none?(collection)
  collection.select { |element| yield(element) }.empty?
end
# This is actually incorrect. It does not return false as soon as an element is
# found to have the block return true

# Trying to use #any? from a previous exercise
def any?(group)
  !group.select { |el| yield(el) }.empty?
end

# This is also the Official Solution
def none?(collection, &block)
  !any?(collection, &block)
end

p none?([1, 3, 5, 6]) { |value| value.even? } == false
p none?([1, 3, 5, 7]) { |value| value.even? } == true
p none?([2, 4, 6, 8]) { |value| value.odd? } == true
p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p none?([1, 3, 5, 7]) { |value| true } == false
p none?([1, 3, 5, 7]) { |value| false } == true
p none?([]) { |value| true } == true

# Note
# "Blocks aren't passed down the calling chain by default. Instead, (in the
# solution above), you need to explicitly pass the block to #any?."
