def step(start, stop, interval)
  raise ArgumentError if interval == 0 || (stop - start) / interval < 0
  counter = start

  while (interval > 0 ? counter <= stop : counter >= stop)
    yield counter
    counter += interval
  end

  start..stop
end

p step(1, 10, -2)
# p step(10, 1, 2)
# p step(1, 10, 2) { |n| puts n }
# p step(10, 1, -2) { |n| puts n }
