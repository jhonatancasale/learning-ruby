print "Enter a value: "
first_num = gets.to_i

print "Another value: "
second_value = gets.to_i

puts first_num.to_s + " + " + second_value.to_s + " = " + 
  (first_num + second_value).to_s


name = "Name"
float = 3.141518
integer = 123

printf "%s, %.3f, %d\n", name, float, integer

p "Hello World!"


## Files
### Reading
File.foreach( 'test.txt' ) do |line|
  puts line
  p line
  p line.chomp
  p line.split
end

begin
  File.foreach( 'do_not_exist.txt' ) do |line|
    puts line.chomp
  end

rescue Exception => e
  puts e.message
  puts "Let's pretend thid didn't happen..."
end

if File.exist? 'test.txt'
  File.foreach('test.txt') do |line|
    puts line.chomp
  end
end

### Writing
# the file is automatically cloased after the block executes
File.open('test1.txt', "w") do |file|
  file.puts "One line"
  file.puts "Another"
end
