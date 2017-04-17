# order are preserved

numbers = {1 => 'one', 2 => 'two'}
puts numbers
puts numbers[1]
puts numbers[2]

stuff = {:array => [1, 2, 3], :string => 'Hi, mon!'}
puts stuff
puts stuff[:string]

another_stuff = {array: [1, 2, 3], string: 'Hi, mon!'} # 1.9
puts another_stuff
puts another_stuff[:string]

hash = Hash.new
p hash.length
hash[:first] = 1
hash[:seconf] = 2

hash.each_pair do |key, value|
  puts "#{key} => #{value}"
end

p hash[:third] # => nil
another_hash = Hash.new(:void) # :void as default value when key are not in hash
p another_hash[:third] # => :void

h = {one: "one"}
p h
#p {one: "one"}
#hashes.rb:32: syntax error, unexpected ':', expecting '}'
p ({one: "one"})
p :one => "one"
p one: "one"  # preferred
