def bubble_sort!(array, &comparator)
  loop do
    swapped = false
    (1...array.size).each do |index|
      first = array[index - 1]
      second = array[index]

      if comparator.nil?
        next if first <= second
      elsif comparator.parameters.size == 1 
        next if comparator.call(first) <= comparator.call(second)
      else
        next if comparator.call(first, second)
      end   

      array[index], array[index - 1] = array[index - 1], array[index]
      swapped = true
    end
    break unless swapped
  end
  nil
end

array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = %w(sue Pete alice Tyler rachel Kim bonnie)
bubble_sort!(array) { |value| value.downcase }
p array == %w(alice bonnie Kim Pete rachel sue Tyler)

array = [5, 3, 7]
bubble_sort!(array) { |first, second| first >= second }
p array == [7, 5, 3]

=begin
Notes
"I wondered if I could write a method that would work for all the above
examples i.e., a method call with:
- no block
- a block with one block variable
- a block with two block variables."

" By using an explicit block we can check the amount of parameters of the Proc
object inside the method, by calling Proc#parameters. Then we can apply this
information to a conditional."
=end
