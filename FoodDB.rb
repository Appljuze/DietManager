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
  def initialize
    @database = Hash.new
  end

  # Add BasicFood object to database
  def add(food)
    @database[food.name] = food
  end

  # Gets a BasicFood object from the database from the specified food name
  def get(name)
    @database[name]
  end

  # Returns true if the food exists in the database
  def contains?(food)
    @database.has_key?(food)
  end

  # Returns true if the food doesn't exist in the database
  def does_not_contain?(food)
    !@database.has_key?(food)
  end

  # Returns true if the database is not empty. Redundant, but useful for readability
  def not_empty?
    !@database.empty?
  end

  # Finds all foods that start with 'prefix'
  def find(prefix)
    puts "Foods matching the prefix '#{prefix}':"
    @database.each_value do |food|
      if food.name.start_with?(prefix)
        food.print
      end
    end
  end

  # Prints all foods currently in the database.
  # Specify either 'recipe' or 'food' when calling the method
  # This is so we don't need two separate methods for this same function.
  def print_all(recipe_or_food)
    puts "Current #{recipe_or_food} in the database:\n"
    @database.each_value do |food|
      food.print
    end
  end

  attr_reader :database

end