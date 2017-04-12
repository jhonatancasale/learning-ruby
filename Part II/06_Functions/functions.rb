def add_nums(num1, num2)
  return num1.to_i + num2.to_i
end

puts add_nums(42, 23)


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
def call_block(&block)
  block.call
end

def pass_block(&block)
  call_block(&block)
end

pass_block {puts 'Hello, block'}
