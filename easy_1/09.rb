def one?(collection)
  collection.select { |element| yield(element) }.length == 1
end

# Correction
# The solution above does not meet the requirement of stoping as soon as
# collection is found to contain more than one element that makes the block
# return true.

def one?(collection)
  found_one = false
  collection.each do |element|
    if (yield(element) && !found_one)
      found_one = true
      next
    end
    return false if (yield(element) && found_one)
  end

  found_one
end

p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
p one?([1, 3, 5, 7]) { |value| true }           # -> false
p one?([1, 3, 5, 7]) { |value| false }          # -> false
p one?([]) { |value| true }                     # -> false

# Official Solution
def one?(collection)
  seen_one = false
  collection.each do |element|
    next unless yield(element)
    return false if seen_one
    seen_one = true
  end
  seen_one
end
