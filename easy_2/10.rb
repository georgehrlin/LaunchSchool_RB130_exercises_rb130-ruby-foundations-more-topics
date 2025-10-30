def each_cons(arr, num_cons)
  idx = 0
  while idx + (num_cons - 1) < arr.size
    args = []
    starting_idx = idx
    num_cons.times { |n| args << arr[starting_idx + n] }
    yield(*args)
    idx += 1
  end

  nil
end

# Improved After LSBot Review
def each_cons(arr, window_size)
  return to e_num(__method__, arr, window_size) unless block_given?
  idx = 0
  while idx + window_size <= arr.size
    yield(*arr[idx...idx + window_size]) # Or *arr[idx, window_size]
    idx += 1
  end

  nil
end

# Using each_index
def each_cons(arr, num_cons)
  return to_enum(__method__, arr, num_cons) unless block_given?

  arr.each_index do |index|
    break if index + num_cons > arr.size
    yield(*arr[index, num_cons])
  end

  nil
end

# By Jon David Fortune
def each_cons(arr, n)
  for i in (0..(arr.size - n))
    yield(*arr[i, n])
  end
end

hash = {}
each_cons([1, 3, 6, 10], 1) do |value|
  hash[value] = true
end
p hash == { 1 => true, 3 => true, 6 => true, 10 => true }

hash = {}
each_cons([1, 3, 6, 10], 2) do |value1, value2|
  hash[value1] = value2
end
p hash == { 1 => 3, 3 => 6, 6 => 10 }

hash = {}
each_cons([1, 3, 6, 10], 3) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6], 3 => [6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 4) do |value1, *values|
  hash[value1] = values
end
p hash == { 1 => [3, 6, 10] }

hash = {}
each_cons([1, 3, 6, 10], 5) do |value1, *values|
  hash[value1] = values
end
p hash == {}
