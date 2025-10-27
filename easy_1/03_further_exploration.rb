def missing(arr)
  result = []
  idx = 0
  until idx == arr.length - 1
    diff_btw_cons = arr[idx + 1] - arr[idx]
    if diff_btw_cons > 1
      increment = 1
      until increment == diff_btw_cons
        result << arr[idx] + increment
        increment += 1
      end
    end
    idx += 1
  end
  result
end

def missing(arr)
  (arr.first..arr.last).to_a - arr
end

def missing(arr)
  combined = (arr + (arr.first..arr.last).to_a)
  combined.select { |n| combined.count(n) == 1 }
end

# By Wayne Olson
def missing(arr)
  (arr.first..arr.last).to_a.difference(arr)
end
