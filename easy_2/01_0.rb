def step(start, finish, step)
  current = start
  while current <= finish
    yield(current)
    current += step
  end

  start..finish
end

# Q: What do you think would be a good return value for this method, and why?
# A: I decided to have the method return a range that begins with the starting
# value and ends with the ending value since that is what Range#step returns.

# Improved After LSBot Review
def step(start, finish, increment)
  raise ArgumentError, 'step must be positive' if increment <= 0
  return to_enum(__method__, start, finish, increment) unless block_given?
  current = start
  while current <= finish
    yield(current)
    current += increment
  end

  start..finish
end

# Official Solution
def step(start_point, end_point, increment)
  current_value = start_point
  loop do
    yield(current_value)
    break if current_value + increment > end_point
    current_value += increment
  end
  current_value
end
