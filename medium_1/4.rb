# This?
def group_the_rest(arr)
  yield(raptors = arr[2..-1])
end

group_the_rest(%w[raven finch hawk eagle]) { |test| p test }

# Or this?
def group_the_rest(arr)
  yield(arr[2..-1])
end

group_the_rest(%w[raven finch hawk eagle]) { |raptors| p raptors }

# Or this? (Here I read the Hint)
def group_the_rest(arr)
  yield(arr)
end

group_the_rest(%w[raven finch hawk eagle]) { |_, _, *raptors| p raptors} # => ["hawk", "eagle"]


def types(arr)
  yield(arr)
end

# By Tovi Newman
birds = %w[raven finch hawk eagle]

types(birds) do |*_, hawk, eagle|
  puts "The raptors are: #{hawk}, #{eagle}."
end
# Output: The raptors are: hawk, eagle.

# By Ryann McQuilton
types(birds) do |_, *birds, eagle|
  puts "The array's got #{birds} in the middle."
end
# Output: The array's got ["finch", "hawk"] in the middle.
