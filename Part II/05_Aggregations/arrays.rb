animals = ['lions', 'tigers', 'bears']

puts animals.class # Array
puts animals

puts animals[0] # lions
puts animals[2] # bears
puts animals[10] # nothing
puts animals[-1] # bears
puts animals[-2] # tigers
puts animals[0..1] # lions \n tigers
puts (0..1).class # Range

a = []
puts a.class
puts [1].methods.include?(:[])

puts a = [[1, 2, 3],[10, 20, 30],[40, 50, 60]]
puts a[0][0] # 1
puts a[1][2] # 30
