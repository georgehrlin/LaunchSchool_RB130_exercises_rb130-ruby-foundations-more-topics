def zip(arr1, arr2)
  arr1.each_with_index.with_object([]) do |(arr1_ele, idx), result|
    result << [arr1_ele, arr2[idx]]
  end
end

# More readable, mostly same idea
def zip(arr1, arr2)
  result = []
  arr1.each_index do |idx|
    result << [arr1[idx], arr2[idx]]
  end

  result
end

# Official Solution
def zip(array1, array2)
  result = []
  index = 0
  length = array1.length
  while index < length
    result << [array1[index], array2[index]]
    index += 1
  end
  result
end

# By Kimberly Ramirez
def zip(arr1, arr2)
  (0...arr1.size).map { |i| [arr1[i], arr2[i]] }
end

# By James Duot
def zip a1, a2
  Array.new(a1.size) { |i| [a1[i], a2[i]] }
end

# By Alexandra Prodan
def zip(arr1, arr2)
  [arr1, arr2].transpose
end

p zip([1, 2, 3], [4, 5, 6]) # == [[1, 4], [2, 5], [3, 6]]
