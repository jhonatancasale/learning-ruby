puts "Math operators"
puts "42 + 23 = " + (42 + 23).to_s
puts "42 - 23 = " + (42 - 23).to_s
puts "42 * 23 = " + (42 * 23).to_s
puts "42 / 23 = " + (42 / 23).to_s
puts "42 / 23.0 = " + (42 / 23.0).to_s
puts "42 % 23 = " + (42 % 23).to_s
puts "42 ** 23 = " + (2 ** 10).to_s

puts "Relational operators"

puts "42 > 23 = " + (42 > 23).to_s
puts "42 < 23 = " + (42 < 23).to_s
puts "42 == 23 = " + (42 == 23).to_s
puts "42 != 23 = " + (42 != 23).to_s
puts "42 >= 23 = " + (42 >= 23).to_s
puts "42 <= 23 = " + (42 <= 23).to_s


puts "true and false = " + (true and false).to_s # &&
puts "true or false = " + (true or false).to_s # ||
puts "not true = " + (not true).to_s # !

puts "the (spaceship) <=> operator"
puts "(a <=> b )  -> {-1, 0, 1}"
puts "-1 if a < b"
puts "0 if a == b"
puts "+1 if a > b"

puts "1 <=> 2 = " + (1 <=> 2).to_s
puts "1 <=> 1 = " + (1 <=> 1).to_s
puts "2 <=> 1 = " + (2 <=> 1).to_s
