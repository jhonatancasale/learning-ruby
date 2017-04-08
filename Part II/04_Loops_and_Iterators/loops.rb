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


# until loop
a = 1
until a >= 10
  a += 1
  next unless (a % 2) == 0
  puts a
end

# for loops
numbers = [1, 2, 3, 4, 5]
for number in numbers
  print "#{number}, "
end
puts ""


# each loop
items = ['a', 'b', 'c', 'd', 'e']
items.each do |item|
  puts "#{item}"
end

(0..5).each do |i|
  puts "# #{i}"
end
