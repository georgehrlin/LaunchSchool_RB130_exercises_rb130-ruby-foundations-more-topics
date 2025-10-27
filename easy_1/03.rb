# def missing(arr)
#   result = []
#   (arr.first..arr.last).each { |n| result << n unless arr.include?(n) }
#   result
# end

# Official Solution
def missing(array)
  result = []
  array.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
    p result
  end
  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []
