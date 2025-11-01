# Replace the two 'method_name' placeholders with actual method calls
def convert_to_base_8(n)
  n.to_s(8).to_i
end

# Replace 'argument' with the correct argument below
# 'method' is 'Object#method', not a placeholder
base8_proc = method(:convert_to_base_8).to_proc

# We'll need a Proc object to make this code work
# Replace `a_proc` with the correct object
p [8, 10, 12, 14, 16, 33].map(&base8_proc)

# By Jason Wang
# If we want to pass each element to a custom method, use Object#method to wrap
# the method in a Method object, then prepending it with & which invokes
# Method#to_proc and converts the resulting proc to a block.

# If we want to invoke a method on each element (assuming the element's class
# has defined that method), prepending a symbol with & invokes Symbol#to_proc
# and converts the resulting proc to a block. In this question, however, we
# cannot do this with :convert_to_base_8 because the Integer class has not
# defined a convert_to_base_8 method.
