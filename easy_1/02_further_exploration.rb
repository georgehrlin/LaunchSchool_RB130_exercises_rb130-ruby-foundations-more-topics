def compute(arg)
  block_given? ? yield(arg) : 'Does not compute.'
end

p compute('hi')
p compute('hi') { |str| str.upcase }
p compute('hi') { "I don't care about the argument. :P"}
