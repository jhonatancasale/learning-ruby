animals = ['lions', 'tigers', 'bears']

puts animals.class # => Array
puts animals

puts animals[0] # => lions
puts animals[2] # => bears
puts animals[10] # => nothing
puts animals[-1] # => bears
puts animals[-2] # => tigers
puts animals[0..1] # => lions \n tigers
puts (0..1).class # => Range

a = []
puts a.class
puts [1].methods.include?(:[])

puts a = [[1, 2, 3],[10, 20, 30],[40, 50, 60]]
puts a[0][0] # 1
puts a[1][2] # 30

heterogeneous_array = ["This", "is", "a", "test", 42, 23, :fail_whale, 7.2]
puts heterogeneous_array

arr_words = %w{ what a great day today! }
puts arr_words[-2] # => day
puts "#{arr_words.first} - #{arr_words.last}"
p arr_words[-3, 2] # => ["great", "day"] # (go back 3 and take 2)
p arr_words[2..4] # => ["great", "day", "today!"]
puts arr_words.join(',')
puts arr_words.join(' ')

## Append: push or <<
## Remove: pop or shift
## Set: []= 
## Sort
## Reverse
## sample

# (LIFO)
stack = []
stack << "one"
stack.push("two")
puts stack.pop

# (FIFO)
queue = []
queue.push("one")
queue.push "two"
puts queue.shift

a = [5, 3, 3, 2, 1, 0].sort!.reverse!
p a
p a.sample(2)

a[13] = 11
p a


a = Array(1..10)
a.each { |num| print "#{num} "}
puts

new_arr = a.select { |num| num > 4 }
p new_arr

new_arr = a.select { |num| num < 10 }.reject{ |num| num.even? }
p new_arr

new_arr = a.map { |num| num * 3 }
p new_arr

p a.shuffle
