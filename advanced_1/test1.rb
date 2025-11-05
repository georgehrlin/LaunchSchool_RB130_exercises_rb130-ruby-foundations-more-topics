# Lambda returns to the caller, method keeps running
def demo_lambda
  l = -> { return :from_lambda }
  val = l.call
  :after_lambda
end

p demo_lambda # => :after_lambda

# Proc returns from the defining method (early exit)
def demo_proc
  p = Proc.new { return :from_proc }
  p.call
  :after_proc
end

p demo_proc # => :from_proc

# Calling that proc later? Boom: LocalJumpError
def make_proc
  Proc.new { return :from_proc }
end

pobj = make_proc
pobj.call # LocalJumpError
# Why? The proc wants to return from make_proc, but make_proc has already
# finished and isn’t on the stack anymore.
