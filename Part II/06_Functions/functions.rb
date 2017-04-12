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
  b = temp
end
puts "After: a:#{a} and b:#{b} "

# kind a functional
def add(*args)
  args.reduce(0){ |result, item| result + item}
end

puts add 1, 1, 1, 23
