a = 42
b = 23
c = 0xbad_c0de # allow `_` separator

# if, elsif, else statement
if a > 0 and a < c
  puts "0 < a < c"
elsif a > 0 and a > b
  puts "0 < b < a"
else
  puts "ok"
end


# unless statement
unless a > b
  puts "b > b"
else
  puts "a > b"
end


# Conditional output
puts "a > b" if a > b


# Switch case structure
case a
when 42
  puts "42"
when 23
  puts "23"
else
  puts "?"
end


# Ternary operator
puts (a % 2 == 1) ? "Odd" : "Even"

# Exceptions
print "Enter a Number : "
n1 = gets.to_i

print "Enter another : "
n2 = gets.to_i

begin
  puts "#{n1} / #{n2} = #{n1 / n2}"
rescue
  puts "Cannot divide by 0"
end


def check_boudary(try)
  raise ArgumentError, "Enter a Positive Number" unless try > 0
end

begin
  check_boudary(-1)
rescue ArgumentError
  puts "That is an impossible boudary"
end
