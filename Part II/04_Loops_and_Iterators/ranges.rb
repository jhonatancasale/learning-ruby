p Array(1..10) #=> [1, 2, 3, 4, 5, 6, 7, 8, 9, 10] [begin, end]
p Array(1...10) #=> [1, 2, 3, 4, 5, 6, 7, 8, 9] [begin, end[

# or
p (0...10).to_a
p (0...10).to_a.sample(3)
