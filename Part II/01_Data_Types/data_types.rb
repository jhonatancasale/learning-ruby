puts "Integers | Fixed Numbers"
puts (0xffffffff)
puts (0x00000000000000000000000000000000).to_s # 128 bits
puts 1.class
puts 4.methods
#    => [:%, :&, :*, :+, :-, :/, :<, :>, :^, :|, :~, :-@, :**, :<=>, :<<, :>>, :<=, :>=, :==, :===, :[], :inspect, :size, :succ, :to_s, :to_f, :div, :divmod, :fdiv, :modulo, :abs, :magnitude, :zero?, :odd?, :even?, :bit_length, :to_int, :to_i, :next, :upto, :chr, :ord, :integer?, :floor, :ceil, :round, :truncate, :downto, :times, :pred, :to_r, :numerator, :denominator, :rationalize, :gcd, :lcm, :gcdlcm, :+@, :eql?, :singleton_method_added, :coerce, :i, :remainder, :real?, :nonzero?, :step, :positive?, :negative?, :quo, :arg, :rectangular, :rect, :polar, :real, :imaginary, :imag, :abs2, :angle, :phase, :conjugate, :conj, :to_c, :between?, :instance_of?, :public_send, :instance_variable_get, :instance_variable_set, :instance_variable_defined?, :remove_instance_variable, :private_methods, :kind_of?, :instance_variables, :tap, :public_method, :singleton_method, :is_a?, :extend, :define_singleton_method, :method, :to_enum, :enum_for, :=~, :!~, :respond_to?, :freeze, :display, :object_id, :send, :nil?, :hash, :class, :singleton_class, :clone, :dup, :itself, :taint, :tainted?, :untaint, :untrust, :trust, :untrusted?, :methods, :protected_methods, :frozen?, :public_methods, :singleton_methods, :!, :!=, :__send__, :equal?, :instance_eval, :instance_exec, :__id__] 

puts 4.+ 4


puts "Floats"
one = 1
dot99 = 0.99
puts one.to_s + " - " + dot99.to_s + " = " + (one - dot99).to_s

puts 42.23.class
puts "Hello, World!".class

puts "Constants"
# data_types.rb:14: warning: previous definition of CONSTANT_VALUES was here
CONSTANT_VALUES = 42.23 

#data_types.rb:16: warning: already initialized constant CONSTANT_VALUES
CONSTANT_VALUES = 42.99

# but prints 42.99
puts CONSTANT_VALUES

puts false.class
puts true.class
