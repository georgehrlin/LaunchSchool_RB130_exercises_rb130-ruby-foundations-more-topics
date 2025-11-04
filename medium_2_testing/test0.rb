def test_named_params(test1: 0, test2: 1, test3:)
  print test1, test2, test3, "\n"
end

test_named_params(test3: 7)           # Output: 017
test_named_params(test2: 4, test3: 7) # Output: 047
test_named_params(6)                  # ArgumentError
test_named_params(test1: 4, test2: 6) # ArgumentError
