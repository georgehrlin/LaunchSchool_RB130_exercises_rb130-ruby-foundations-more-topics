def factorial(how_many)
  fact = Enumerator.new do |y|
    a = 1
    inc = 0
    loop do
      inc += 1
      y.yield(a)
      a *= inc
    end
  end

  fact.take(how_many)
end
