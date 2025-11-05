# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc        # Output: #<Proc:0x0000000101192808 2.rb:2>
puts my_proc.class  # Output: Proc
my_proc.call        # Output: This is a .
my_proc.call('cat') # Output: This is a cat.

=begin
1. A proc is initialized using Kernel#proc, which is equivalent to Proc.new.
   The actual content of the proc is stored in a block
   (Grok: proc {} is syntactic sugar for Proc.new {})
2. puts my_proc outputs the string representation of the proc:
  - #< indicates this is an internal representation and not meant for end-user
    display
  - Proc is the class
  - 0x0000000101192808 is the object ID in hexadecimal which is also the memory
    address (Correction (ChatGPT): 0x0000000101192808 should be treated as an
    internal identifier derived from the object's id. It is not guranteed to be
    a literal memory address or stable across runs.)
  - 2.rb:2 is the source location where the proc is created
3. Proc#call invokes the block and returns the last expression evaluated in the
   block (which is nil in this case). It also shows that regular procs have 
   lenient arity: The number of arguments passed to call does not have to match
   the number of block parameters the proc has
4. When an argument is passed to Proc#call, it is assigned to the block
   parameter
=end
puts '=========================='

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda        # Output: #<Proc:0x0000000100af1c60 2.rb:27 (lambda)>
puts my_second_lambda # Output: #<Proc:0x0000000100af1c10 2.rb:28 (lambda)>
puts my_lambda.class  # Output: Proc
my_lambda.call('dog') # Output: This is a dog.
my_lambda.call        # Output: 2.rb:27:in `block in <main>': wrong number of arguments (given 0, expected 1) (ArgumentError)
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." } # Output: 2.rb:34:in `<main>': uninitialized constant Lambda (NameError)

=begin
According to the Ruby documentation, lambdas are a flavour of procs. Regular
procs are non-lambda procs.
(Qwen: Lambdas are Proc objects with special behaviour, not a subclass.)
1. A lambda can be initialized using Kernel#lambda.
2. A lambda can also be initialized using what is called the Lambda proc
   literal syntax.
3. It can be seen with the output of the string representation of a lambda that
   it is in fact an object of the Proc class, even though the output indicates
   it is "a proc with lambda semantics" with a (lambda) at the end.
   (Correction: The lambda proc literal syntax is more commonly referred to as
   simply "lmbda literal" or "stabby lambda syntax")
4. (Same as the point above)
5. The class of a lambda is in fact Proc
6. The argument passed to call is assigned to the lambda's block parameter
7. Lambdas have strict arity: The number of arguments passed to call has to
   match the number of block parameters
8. There is no such a built-in class as Lambda, so Lambda.new raises a
   NameError
=end
puts '=========================='

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}." }
# Output: This is a .
block_method_1('seal')
# Output: 2.rb:58:in `block_method_1': no block given (yield) (LocalJumpError)

=begin
1. The output of the first invocation of block_method_1 is missing the string
   "seal" because the method parameter is not passed to yield as an argument
2. The second invocation of block_method_1 raises a LocalJumpError because
   it is not invoked with a block as an argument, so yield fails to function
=end
puts '=========================='

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}." }
# Output: This is a turtle.
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# Output: This is a turtle and a .
block_method_2('turtle') { puts "This is a #{animal}." }
# Output: 2.rb:85:in `block in <main>': undefined local variable or method `animal' for main:Object (NameError)

=begin
1. When yield is executed with an argument, it passes the argument to the block
   and assigns the block parameter to the argument if they are available
2. Blocks have lenient arity. In the case where there are more block parameters
   than method arguments, the extra block parameters are assigned nil.
3. If a value is not explicitly passed to a block as an argument to yield, such
   value does not become a part of the block's binding.
   (LSBot: "A block closes over the scope where it is defined, not the method's
   local scope where it is called. Therefore, the method's local variable
   animal is not visible to the block unless it is passed in via yield and
   captured by a block parameter.")
   (Qwen: animal is undefined in the block because it's a local variable of
   block_method_2, not passed to the block via yield. Blocks can't access
   method-local variables unless explicitly passed as arguments.)
=end

=begin
Final Analysis

Blocks, procs, and lambdas are all types of closures in Ruby. When we refer to
procs, we are usually referring to regular procs. This is because lambdas are
also a type of procs. The Ruby documentation refers to lambdas as "procs with
lambda semantics". The fact that lambdas are also procs is demonstrated with
code in Group 2. Remember, there is no built-in class named Lambda.

Blocks and procs have lenient arity: The number of arguments passed to call
does not have to match the number of parameters in the block. If there are
arguments than block parameters, the additional parameters are simply assigned
to nil.
(Correction: “Blocks and procs have lenient arity: the number of arguments
passed does not have to match the number of block parameters. Extra arguments
are ignored; missing parameters become nil.”)

On the other hand, lambdas, like methods, have strict arity: The number of
arguments passed to call has to match the number of parameters in the block.
Otherwise, an ArgumentError is raised.
=end

=begin
Notes from LSBot

"Another common lambda versus proc difference is return behaviour. A return
inside a lambda returns from the lambda. A return inside a non-lambda proc
tries to return from the enclosing method, which can raise an error at the top
level."
=end
