def max_by(arr)
  idx = 0
  idx_current_max = idx

  while idx < arr.length - 1 # Wrong: This fails to check the last element if it's the largest
    idx_current_max = case yield(arr[idx_current_max]) <=> yield(arr[idx])
                      when -1 then idx
                      when 1 then idx_current_max
                      else        idx_current_max
                      end
    idx += 1
  end

  arr[idx_current_max]
end

# Correction
def max_by(arr)
  idx = 0
  idx_current_max = idx

  while idx < arr.length
    idx_current_max = case yield(arr[idx_current_max]) <=> yield(arr[idx])
                      when -1 then idx
                      when 1  then idx_current_max
                      else         idx_current_max
                      end
    idx += 1
  end

  arr[idx_current_max]
end

# Improved After LSBot Review
# def max_by(array)
#   return nil if array.empty?

#   index = 0
#   current_largest_index = index
#   current_block_value = yield(array[current_largest_index])

#   while index < array.size
#     if yield(array[index]) > current_block_value
#       current_largest_index = index
#       current_block_value = yield(array[current_largest_index])
#     end
#     index += 1
#   end

#   array[current_largest_index]
# end

p max_by([1, 3, 5]) { |value| value } # == 5
p max_by([1, 5, 3]) { |value| value + 2 } # == 5
p max_by([1, 5, 3]) { |value| 9 - value } # == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } # == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } # == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } # == -7
p max_by([]) { |value| value + 5 } # == nil

# Official Solution
def max_by(array)
  return nil if array.empty?

  max_element = array.first
  largest = yield(max_element)

  array[1..-1].each do |item|
    yielded_value = yield(item)
    if largest < yielded_value
      largest = yielded_value
      max_element = item
    end
  end

  max_element
end

# By Juliette Sinibardy
def max_by(array)
  list = {}
  array.each { |item| list[item] = yield(item) }
  list.key(list.values.max)
end

# By William Robert Mills
def max_by(array)
  largest_item = array.first
  array.each do |item|
    largest_item = item if yield(item) > yield(largest_item)
  end

  largest_item
end
