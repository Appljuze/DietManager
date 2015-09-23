=begin

  Kyler Brown
  Ruby Diet Manager Project
  SWEN 250 Section 01
  Project Created on 9/18/2015

  - This is a helper class used for storing the food.
  - This class is based around a hash, with the name
  of the food as the key and the value as a BasicFood object

=end

class FoodDB

  # Initialize the database hash
  def initialize()
    @database = Hash.new
  end

  # Add BasicFood object to database
  def add(food)
    @database[food.name] = food
  end

  # Gets a BasicFood object from the database from a food name
  def get(name)
    @database[name]
  end

  # Returns true if the food exists in the database
  def contains?(food)
    @database.has_key?(food)
  end

  # Returns true if the database is not empty. Redundant, but useful for readability
  def notEmpty?
    !@database.empty?
  end

  # Finds all foods that start with 'prefix'
  def find(prefix)
    @database.each_value do |food|
      if food.name.start_with?(prefix)
        food.print
      end
    end
  end

  def printAll(recipeOrFood)
    puts "Current #{recipeOrFood} in the database:\n"
    @database.each_value do |food|
      food.print
    end
  end

  attr_reader :database

end