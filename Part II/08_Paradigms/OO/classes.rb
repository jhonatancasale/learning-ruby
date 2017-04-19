class Animal
  def initialize
    puts "Creating a new Animal"
  end

  def set_name(new_name)
    @name = new_name
  end

  def get_name
    @name
  end

  def name
    @name
  end

  def name=(new_name)
    if new_name.is_a?(Numeric)
      puts "Name can't be a Number"
    else
      @name = new_name
    end
  end
end

cat = Animal.new

cat.set_name("Peekaboo")
puts cat.get_name
puts cat.name

cat.name = "Sophie"
puts cat.name

class Dog
  #attr_reader :name, :heigth, :weight # all getter functions automatically
  #attr_writer :name, :heigth, :weight # all setter functions automatically
  attr_accessor :name, :heigth, :weight # all getters and setter at once

  def bark
    return "Generic Bark"
  end
end

rover = Dog.new

rover.name = "Rover"
puts rover.name

class GermanShepard < Dog # inheritance
  def bark
    return "Loud Bark"
  end
end

max = GermanShepard.new
max.name = "Max"

printf "%s goes %s \n", max.name, max.bark()

# Ruby class can inherit from only one parent
puts 4.class
puts 4.class.superclass
puts 4.class.superclass.superclass
puts 4.class.superclass.superclass.superclass
puts 4.class.superclass.superclass.superclass.superclass
puts 4.class.superclass.superclass.superclass.superclass.superclass

# open classes
class NilClass
  def blank?
    true
  end
end

class String
  def blank?
    self.size == 0
  end
end

["", "person", nil].each do |element|
  puts element unless element.blank?
end

class Numeric
  def inches
    self
  end

  def feet
    self * 12.inches
  end

  def yards
    self * 3.feet
  end

  def miles
    self * 5280.feet
  end

  def back
    self * -1
  end

  def forward
    self
  end
end

puts "Open classes with USA metrics"
puts 10.miles.back
puts 2.feet.forward

# method_missing
class Roman
  def self.method_missing name, *args
    roman = name.to_s
    roman.gsub!("IV", "IIII")
    roman.gsub!("IX", "VIIII")
    roman.gsub!("XL", "XXXX")
    roman.gsub!("XC", "LXXXX")

    ( roman.count("I") +
      roman.count("V") * 5 +
      roman.count("X") * 10 +
      roman.count("L") * 50 +
      roman.count("C") * 100 )
  end
end

puts "Roman with method_missing"
puts Roman.X
puts Roman.XC
puts Roman.XII
puts Roman.X


class Person
  def initialize (name, age) # constructor
    @name = name
    @age = age
  end

  def get_info
    @additional_info = "Interesting" # instance variable
    "Name: #{@name}, age: #{@age}"
  end
end

person0 = Person.new('Bruce', 42)
person1 = Person.new('Joe', 23)

p person0.instance_variables # => [:@name, :@age]
p person1.instance_variables # => [:@name, :@age]

puts person1.get_info # => Name: Joe, age: 23

p person0.instance_variables # => [:@name, :@age]
p person1.instance_variables # => [:@name, :@age, :@additional_info]


class Person
  attr_reader :age
  attr_accessor :name

  def initialize (name, ageVar)
    @name = name
    self.age = ageVar
    puts age
  end

  def age= (new_age)
    @age = new_age unless new_age > 120
  end
end

person2 = Person.new("John", 42) # => 42
puts "My age is #{person2.age}"
person2.age = 130
puts person2.age


class Test
  def value
    @value ||= 42
  end

  def value= (new_value)
    @value = new_value
  end
end

t = Test.new
p t.value
t.value = 23
p t.value


class Person
  attr_reader :age
  attr_accessor :name

  def initialize (nage, age)
    @name = name
    self.age = age
  end

  def age= (new_age)
    @age ||= 5
    @age = new_age unless new_age > 120
  end
end

person3 = Person.new("Jar", 130)
p person3.age
person3.age = 10
p person3.age
person3.age = 300
p person3.age
