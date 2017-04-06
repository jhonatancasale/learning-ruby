puts "Integers | Fixed Numbers"
puts (0xffffffff)
puts (0x00000000000000000000000000000000).to_s # 128 bits

puts "Floats"
one = 1
dot99 = 0.99
puts one.to_s + " - " + dot99.to_s + " = " + (one - dot99).to_s

puts 1.class
puts 42.23.class
puts "Hello, World!".class

puts "Constants"
# data_types.rb:14: warning: previous definition of CONSTANT_VALUES was here
CONSTANT_VALUES = 42.23 

#data_types.rb:16: warning: already initialized constant CONSTANT_VALUES
CONSTANT_VALUES = 42.99

# but prints 42.99
puts CONSTANT_VALUES
