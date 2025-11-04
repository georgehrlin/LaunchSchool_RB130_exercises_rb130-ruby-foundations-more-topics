require 'stringio'

def test_stdin(input = $stdin)
  print "Enter something: " unless input.is_a?(StringIO)
  my_string = input.gets.chomp
  puts my_string
end

test_stdin
test_stdin(StringIO.new("Hello, World!"))
