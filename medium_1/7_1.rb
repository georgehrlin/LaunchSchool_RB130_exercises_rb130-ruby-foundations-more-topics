def bubble_sort!(array)
  comparator = block_given? ? ->(a, b) { yield(a, b) } : ->(a, b) { a <= b }

  loop do
    swapped = false
    1.upto(array.size - 1) do |index|
      next if comparator.call(array[index - 1], array[index])

      array[index - 1], array[index] = array[index], array[index - 1]
      swapped = true
    end

    break unless swapped
  end
end

=begin
Notes
This solution is suggested in LSBot's review, although I've never seen the
->(a, b) { ... } expression so I had to ask other AIs to help me understand
this solution.

-> is Ruby's shorthand notation for creating a lambda:
->(a, b) { ... } is the same as lambda { |a, b| ... }

"On line 2, a comparator lambda is created. It uses a ternary operator. If a
block is given to the method, use a lambda that yields the two values to that
block and returns whatever the block returns. Otherwise, use a default lambda
that just checkes if a <= b." (Grok)

"On line 7, instead of separate if/else branches, just call the comparator with
the two elements. If it returns true (meaning they're already in order), skip
the swap." (Grok)
=end
