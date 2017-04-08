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
