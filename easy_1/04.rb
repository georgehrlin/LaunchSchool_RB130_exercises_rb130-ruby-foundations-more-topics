def timer
  before = Time.now
  yield
  after = Time.now
  puts after - before
end

def divisors1(n)
  (1..n).select { |divisor| n % divisor == 0 }
end

def divisors2(n)
  return [1] if n == 1
  result = []
  (1..n / 2).each do |divisor|
    if n % divisor == 0
      result << divisor
      result << n / divisor
    end
  end
  result.uniq.sort
end

# By Jason Wang
def divisors3(n)
  result = []
  (1..Math.sqrt(n)).each do |divisor|
    result << divisor << n / divisor if n % divisor == 0
  end
  result.uniq.sort
end

def divisors4(n)
  result = []
  (1..Math.sqrt(n).to_i).each do |divisor|
    result << divisor << n / divisor if n % divisor == 0
  end
  result.uniq.sort
end

# timer { divisors1(99400891) }
# timer { divisors2(99400891) }
timer { divisors3(99400891) }
timer { divisors4(99400891) }

timer { Math.sqrt(99400891) }
timer { Math.sqrt(99400891).to_i }

# Official Solution
# def divisors(number)
#   1.upto(number).select do |candidate|
#     number % candidate == 0
#   end
# end

# p divisors(1) == [1]
# p divisors(2) == [1, 2]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
# p divisors(999962000357)

