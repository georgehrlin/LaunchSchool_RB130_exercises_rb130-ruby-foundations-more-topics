def bubble_sort!(array)
  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      if block_given?
        next if yield(array[index - 1]) <= yield(array[index])
      else
        next if array[index - 1] <= array[index]
      end

      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array # == %w(alice bonnie Kim Pete rachel sue Tyler)

# LSBot's Suggestion
def bubble_sort!(array, &block)
key = block || ->(x) { x }

loop do
  swapped = false
  1.upto(array.size - 1) do |i|
    left, right = array[i - 1], array[i]
    left_key  = key.call(left)
    right_key = key.call(right)
    next if left_key <= right_key

    array[i - 1], array[i] = right, left
    swapped = true
  end
  break unless swapped
end
end

=begin
LSBot:
Reduce branching inside the inner loop. You can capture the block once and use
a single “key” function everywhere. This makes the intent clearer and avoids
repeating the block_given?

I computed left_key and right_key once per comparison so the block is evaluated
once per element in that comparison. This can help avoid surprising behavior if
the block has side effects or randomness.
=end
