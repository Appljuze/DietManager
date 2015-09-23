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
    @calories = calories.to_i
  end

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

  attr_accessor :name, :calories
end