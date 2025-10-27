def any?(group)
  !group.select { |el| yield(el) }.empty?
end

h = {a: 0, b: 1, c: 2}
p any?(h) { |k, v| h[k] == 2}
