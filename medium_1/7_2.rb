def bubble_sort!(array, &block)
  comparator = block || Proc.new { |a, b| a <= b }

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
This soluttion is also suggested in LSBot's review but I don't fully understand
it. Below are parts of Grok's explanation:
"By adding &block to the method parameters, Ruby automatically converts the
passed block into a Proc object."
"No need for block_given? or yield—you just use block.call(a, b) directly if a
block was passed."
"The || operator provides the default: if block is nil, it uses the default
Proc." (Grok)
=end
