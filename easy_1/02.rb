def compute(&block)
  block_given? ? block.call : 'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# Official Solution
def compute
  return 'Does not compute.' unless block_given?
  yield
end

# LSBot's Suggestion
def compute(&block)
  block ? block.call : 'Does not compute.'
end

def compute
  block_given? ? yield : 'Does not compute.'
end
