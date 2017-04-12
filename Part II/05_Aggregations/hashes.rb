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
