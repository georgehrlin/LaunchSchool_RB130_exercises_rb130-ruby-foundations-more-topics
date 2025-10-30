def each_cons(arr)
  idx = 0
  while idx < arr.length - 1
    yield(arr[idx], arr[idx + 1])
    idx += 1
  end

  nil
end

# Improved After LSBot Reivew
def each_cons(arr)
  return to_enum(__method__, arr) unless block_given?
  idx = 0
  while idx + 1 < arr.size
    yield(arr[idx], arr[idx + 1])
    idx += 1
  end

  nil
end

def each_cons(arr)
  arr.each_with_index do |element, index|
    yield(element, arr[index + 1]) unless index + 1 == arr.length
  end

  nil
end

hash = {}
result = each_cons([1, 3, 6, 10]) do |value1, value2|
  hash[value1] = value2
end
p result == nil
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
result = each_cons([]) do |value1, value2|
  hash[value1] = value2
end
p hash == {}
p result == nil

hash = {}
result = each_cons(['a', 'b']) do |value1, value2|
  hash[value1] = value2
end
p hash == {'a' => 'b'}
p result == nil
