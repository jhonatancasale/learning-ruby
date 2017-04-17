# loop do
x = 1
loop do
  x += 1 # x = x + 1
  next unless (x % 2) == 0  # continue
  puts x
  break if x >= 10
end


# while loop
y = 1
while y <= 10
  y += 1
  next unless (y % 2) == 0
  puts y
end

x = 0
x = x + 1 while x < 10
puts x

# while modifier form
times_2 = 2
times_2 *= 2 while times_2 < 100
puts "times_2: #{ times_2}"

# until loop
a = 1
until a >= 10
  a += 1
  next unless (a % 2) == 0
  puts a
end

x = 10
x = x - 1 until x == 1
puts x

# for loops
# each and times are preferred
numbers = [1, 2, 3, 4, 5]
for number in numbers
  print "#{number}, "
end
puts ""

for i in 0..2 # => 0, 1, 2
  puts "for loop with range: #{i}"
end


# each loop
items = ['a', 'b', 'c', 'd', 'e']
items.each do |item|
  puts "#{item}"
end

#in a single line
items.each {|item| puts "#{item}"}

properties = ['object oriented', 'duck typed', 'productive', 'fun']
properties.each { |property| puts "Ruby is #{property}."}

(0..5).each do |i|
  puts "# #{i}"
end


# Fixnum times loop
5.times do
  puts "Hello World!"
end

# or
var = 5
var.times do
  puts "Hello World!"
end

=begin
or this way ...
You can specify code blocks with {/} or do/end. The typical Ruby convention
is to use braces when your code block is on one line and use do/end from when
=end
3.times {puts 'Goodbye World! o/'}


# blocks
# by convention
# 1 line {}
# multiple lines do/end

1.times {puts "Hello"}

2.times do |index| # <- parameter(s)
  if index > 0
    puts index
  end
end

2.times {|index| puts index if index > 0}
