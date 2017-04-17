def add_nums(num1, num2)
  return num1.to_i + num2.to_i
end

puts add_nums(42, 23)


# more generic
def add a, b
  a + b
end

puts add 23, 42
puts add "This ", "is a test"

# NOTE values are passed by value
a = 42
b = 23
puts "Before: a:#{a} and b:#{b} "
def bad_swap(a, b)
  tmp = a
  a = b
  b = tmp
end
puts "After: a:#{a} and b:#{b} "

# kind a functional
def add(*args)
  args.reduce(0){ |result, item| result + item}
end

puts add 1, 1, 1, 23
def tell_the_truth(options={})

  if options[:profession] == :lawyer
    'it could be believed that this is almost certainly not false'
  else
    true
  end
end

puts tell_the_truth
puts tell_the_truth( :profession => :lawyer )

# param passage
def call_block(&block) # must be the last param
  block.call
end

def pass_block(&block)
  call_block(&block)
end

pass_block {puts 'Hello, block'}


# Default values
def factorial_with_default n = 5
  n == 0 ? 1 : n * factorial_with_default(n-1)
end

puts factorial_with_default 10
puts factorial_with_default

# Splat params
def max one_param, *numbers, another
  puts "one_param: #{one_param}"
  puts "another: #{another}"
  # numbers is an Array
  numbers.max
end

puts max "something", 7, 42, -4, "mone" # => 42


# Blocks

def two_times_implicit
  return "No Block" unless block_given?
  yield
  yield
end

puts two_times_implicit {print "Hello "} # => Hello Hello
puts two_times_implicit # => No Block

def two_times_explicit &i_am_a_block
  return "No Block" unless block_given?
  i_am_a_block.call
  i_am_a_block.call
end

puts two_times_explicit {print "Hello "} # => Hello Hello
puts two_times_explicit # => No Block
