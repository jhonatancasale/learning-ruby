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
