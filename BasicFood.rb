=begin

  Kyler Brown
  Ruby Diet Manager Project
  SWEN 250 Section 01
  Project Created on 9/18/2015

  - This class is used to create objects out of each
    food, each with its own name and calorie count

=end

class BasicFood

  def initialize(name, calories)
    @name = name
    # Convert calories to an integer, since it comes in as a String
    @calories = calories.to_i
  end

  # Overrides the to_s method to just print out the
  # food's name instead of the BasicFood object
  def to_s
    @name
  end

  # Prints the food to the console, with formatting.
  def print
    puts "- #{name} : #{calories} calories"
  end

  # Prints with indentation. Used for printing a recipe
  def recipePrint
    puts "   | #{name} : #{calories} calories"
  end

  # Writes the object to FoodDB.txt. Does NOT close the file
  def writeToFile(file)
    file.write("#{name},b,#{calories}\n")
  end

  attr_reader :name, :calories
end