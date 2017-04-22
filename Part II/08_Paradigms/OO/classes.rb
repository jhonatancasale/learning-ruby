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

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Ruby class can inherit from only one parent
puts 4.class
puts 4.class.superclass
puts 4.class.superclass.superclass
puts 4.class.superclass.superclass.superclass
puts 4.class.superclass.superclass.superclass.superclass
puts 4.class.superclass.superclass.superclass.superclass.superclass

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

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

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class MathFunctions
  def self.double(var) # 1. Using self
   times_called
   var * 2
  end

  class << self # 2. Using << self
    def times_called
      @@times_called ||= 0  # @@ means class variables
      @@times_called += 1
    end
  end
end
def MathFunctions.triple(var) # 3. Outside of the class
  times_called
  var * 3
end

# No instance created!
puts MathFunctions.double 5 # => 10
puts MathFunctions.triple(3) # => 9
puts MathFunctions.times_called # => 3

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# No multiple inheritance
# Mixins are used instead


class Dog # implicitly inherits from Object
  def to_s
    "Dog"
  end

  def bark
    "barks loudly"
  end
end

class SmallDog < Dog # Denotes inheritance
  def bark # override
    "barks quietly"
  end
end

dog = Dog.new # (btw, new ia a class method)
small_dog = SmallDog.new
puts "#{dog}1 #{dog.bark}"
puts "#{small_dog}2 #{small_dog.bark}"

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Modules as Namespaces
module Sports
  class Match
    attr_accessor :score
  end
end

module Patterns
  class Match
    attr_accessor :complete
  end
end

match1 = Sports::Match.new
match1.score = 45
puts match1.score # => 45

match2 = Patterns::Match.new
match2.complete = true
puts match2.complete # => true

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Module as Mixin/Mix-in
module SayMyName
  attr_accessor :name
  def print_name
    puts "Name: #{@name}"
  end
end

class AnotherPerson
  include SayMyName
end

class Company
  include SayMyName
end

person = AnotherPerson.new
person.name = "Bruce"
person.print_name # => Name: Bruce

company = Company.new
company.name = "Name: Some fancy company name here"
company.print_name # => Soma fancy company name here

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# For example, in a file named: player.rb
class Player

  attr_reader :name, :age, :skill_level

  def initialize (name, age, skill_level)
    @name = name
    @age = age
    @skill_level = skill_level
  end

  def to_s
    "<#{name}: #{skill_level}(SL), #{age}(AGE)>"
  end

end


# Now, supose another file named: team.rb

class Team
  include Enumerable

  attr_accessor :name, :players

  def initialize (name)
    @name = name
    @players = []
  end

  def add_players (*players) # remember splats ?
    @players += players
  end

  def to_s
    "#{@name} team: #{players.join(", ")}"
  end

  def each
    @players.each { |player| yield player }
  end
end

# require_relative allows importing other .rb files
require_relative 'player' # relative to the current ruby code `this`
require_relative 'team'

player1 = Player.new("A", 13, 5)
player2 = Player.new("B", 15, 4.5)
player3 = Player.new("C", 21, 5)
player4 = Player.new("D", 14, 5)
player5 = Player.new("E", 16, 3)

red_team = Team.new("Red")
red_team.add_players(player1, player2, player3, player4, player5) # splat again

# select only players between 14 and 20 and reject any player below 4.5
# skil-level
elig_players = red_team.select { |player| (14..20) === player.age }
                       .reject { |player| player.skill_level < 4.5 }
puts elig_players

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Scope
#
# Scope: Variables
# Methods and Classes begin new_scope for variables
# Outer scope variables do not get carried over to the inner scope
# User `local_variables` method to see which variables are in (and which are
# not in) the current scope

v1 = "Outside"

class MyClass
  def my_method
    # p v1 EXCEPTION THROWN - no such variable exists
    v1 = "inside"
    p v1
    p local_variables
  end
end

p v1 # => Outside
obj = MyClass.new
obj.my_method # => inside
              # => [:v1]
p local_variables # Okay, there's a little bit messy
p self # main

# Scope: Constants
# Constants is any reference that begins with uppercase, including classes and
# modules
# Constants' scope rules are different than variable scope rules
# Inner scope can see constants defined in outer scope and can also override
# outer constants (value remains unchanged outside!)

module AnotherTest
  PI = 3.14

  class Test2
    def what_is_pi
      puts PI
    end
  end
end

AnotherTest::Test2.new.what_is_pi

module MyModule
  MyConstant = "Outer Constant"

  class AnotherMyClass
    puts MyConstant
    MyConstant = 'Inner Constant'
    puts MyConstant
  end

  puts MyConstant
end

# Scope: Block
# Block inherit outer scope
# Block is a Closure
#   Remembers the context in which it was defined and uses that context
#   wheneverit is called

class BankAccount
  attr_accessor :id, :amount

  def initialize (id, amount)
    @id = id
    @amount = amount
  end
end

acct1 = BankAccount.new(123, 200)
acct2 = BankAccount.new(321, 100)
acct3 = BankAccount.new(421, -100)
accts = [acct1, acct2, acct3]

total_sum = 0
accts.each do |eachAcct|
  total_sum += eachAcct.amount
end

puts total_sum # => 200

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

# Block: Local Scope

arr = [5, 4, 1]
cur_number = 10

arr.each do |cur_number|
  some_var = 10 # NOT available outside the block
  print cur_number.to_s + " " # => 5 4 1 
end

puts
puts cur_number # => 10

adjustment = 5
arr.each do |cur_number; adjustment| # here adjustment is treated as local var
  adjustment = 10
  print "#{cur_number + adjustment} " # => 15 14 11 
end

puts
puts adjustment # => (Not affected by the block)

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## Encapsulation
# By default ALL methods are public

class Car
  def initialize(speed, confort)
    @rating = speed * confort
  end

  # Can't SET rating from outside
  def rating
    @rating
  end
end

puts Car.new(4, 5).rating() # => 20

# 2 ways to define

class MyAlgorithm
  private
    def test1
      "Private"
    end
  protected
    def test2
      "Protected"
    end
  public
    def test3
      "Public"
    end
end

class Another
  def test1
    "Private, as declared later on"
  end

  private :test1 #, test2, test2
end

class YetAnotherPerson
  def initialize(age)
    self.age = age # legal assignment
    puts my_age
    #puts self.my_age  # ILLEGAL
  end

  private

    def my_age
      @age
    end

    def age=(age)
      @age = age
    end
end

YetAnotherPerson.new(25) # => 25

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

## Unit Testing
# in an external file calculator.rb
class Calculator
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def add(one, two)
    one - two
  end

  def subtract(one, two)
    one + two
  end

  def divide(one, two)
    one / two
  end
end

# in an external file calculator_test.rb
#require 'test/unit'
#require_relative 'Calculator'
#
#class CalculatorTest < Test::Unit::TestCase
#
#  def setup
#    @calc = Calculator.new('test')
#  end
#
#  def test_addition
#    assert_equal 4, @calc.add(2, 2)
#  end
#
#  def test_subtraction
#    assert_equal 2, @calc.subtract(4, 2)
#  end
#
#  def test_division
#    assert_equal 2, @calc.divide(4, 2)
#  end
#
#end


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


## RSpec
#gem install rspec
#Fetching: diff-lcs-1.3.gem (100%)
#Successfully installed diff-lcs-1.3
#Fetching: rspec-support-3.5.0.gem (100%)
#Successfully installed rspec-support-3.5.0
#Fetching: rspec-mocks-3.5.0.gem (100%)
#Successfully installed rspec-mocks-3.5.0
#Fetching: rspec-expectations-3.5.0.gem (100%)
#Successfully installed rspec-expectations-3.5.0
#Fetching: rspec-core-3.5.4.gem (100%)
#Successfully installed rspec-core-3.5.4
#Fetching: rspec-3.5.0.gem (100%)
#Successfully installed rspec-3.5.0
#Parsing documentation for diff-lcs-1.3
#Couldn't find file to include 'Contributing.rdoc' from README.rdoc
#Couldn't find file to include 'License.rdoc' from README.rdoc
#Installing ri documentation for diff-lcs-1.3
#Parsing documentation for rspec-support-3.5.0
#Installing ri documentation for rspec-support-3.5.0
#Parsing documentation for rspec-mocks-3.5.0
#Installing ri documentation for rspec-mocks-3.5.0
#Parsing documentation for rspec-expectations-3.5.0
#Installing ri documentation for rspec-expectations-3.5.0
#Parsing documentation for rspec-core-3.5.4
#Installing ri documentation for rspec-core-3.5.4
#Parsing documentation for rspec-3.5.0
#Installing ri documentation for rspec-3.5.0
#Done installing documentation for diff-lcs, rspec-support, rspec-mocks, rspec-expectations, rspec-core, rspec after 19 seconds
#6 gems installed

## rspec --init
# create   .rspec
# create   spec/spec_helper.rb
# rspec
# Matchers examples
# be_true / be_false
# eq 3
# raise_error(SomeError)
# be_predicate - boolean
# rspec --format documentation


#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
puts
#%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

