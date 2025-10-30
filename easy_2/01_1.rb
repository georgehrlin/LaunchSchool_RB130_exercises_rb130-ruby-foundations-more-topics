# My previous implementation of #step results in an inifnite loop if
# step/increment is a certain value. I attempt to fix it here
def step(start, finish, increment)
  if start < finish && increment.negative?
    raise ArgumentError, 'a negative increment here will result in an infinite loop'
  elsif start > finish && increment.positive?
    raise ArgumentError, 'a positive increment here will result in an infinite loop'
  elsif increment.zero?
    raise ArgumentError, 'increment cannot be zero'
  end

  return to_enum(__method__, start, finish, increment) unless block_given?

  current = start

  if start < finish
    while current <= finish
      yield(current)
      current += increment
    end
  else
    while (current + increment) > finish
      yield(current)
      current += increment
    end
  end

  current
end

# Improved After LSBot Reivew
def step(start, finish, increment)
  raise ArgumentError, 'increment cannot be zero' if increment.zero?

  if start < finish && increment.negative?
    raise ArgumentError, 'increment must be positive when start < finish'
  elsif start > finish && increment.positive?
    raise ArgumentError, 'increment must be negative when start > finish'
  end

  return to_enum(__method__, start, finish, increment) unless block_given?

  current = start

  if start < finish
    while current + increment < finish
      yield(current)
      current += increment
    end
  elsif start > finish
    while current + increment > finish
      yield(current)
      current += increment
    end
  else
    yield(current)
  end

  current
end

# p step(1, 10, -2)
# p step(10, 1, 2)
p step(1, 10, 2) { |n| puts n }
p step(10, 1, -2) { |n| puts n }
