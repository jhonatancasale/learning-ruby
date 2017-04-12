puts "Add them #{42 + 23} \n\n" # #{} interpolation operator
puts 'Add them #{42 + 23} \n\n' # literal string

multiline_string = <<EOM
\nThis is an example of
a multiline_string with
some interpolation #{42 + 23}
and done \n\n
EOM

puts multiline_string

first_name = "Jhonatan"
last_name = "Casale"

full_name = first_name + last_name

middle_name = "Kevin"

full_name = "#{first_name} #{middle_name} #{last_name}"

puts full_name.include?('Kevin')
puts full_name.size

puts "Vowels : " + full_name.count("aeiou").to_s
puts "Consonants: " + full_name.count("^aeiou").to_s

puts full_name.start_with?('Jhonatan')
puts "Index : " + full_name.index('Casale').to_s

# Simbols
puts 'string'.object_id
puts 'string'.object_id
puts 'Same? ' + ('string'.object_id == 'string'.object_id).to_s

puts :string.object_id
puts :string.object_id
puts 'Same? ' + (:string.object_id == :string.object_id).to_s
