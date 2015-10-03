=begin

  Kyler Brown
  Ruby Diet Manager Project
  SWEN 250 Section 01
  Project Created on 9/18/2015

  - This class is used to create LogItem objects
  - Each LogItem will have a food name and a
  and a DateTime object

=end

require 'time'

class LogItem

  # Initialize a LogItem with the given date and initial food
  def initialize(date, food_name)
    @date = date
    @foods = [food_name.chomp]
  end

  # Adds the specified food to the 'foods' array
  def add_food(food)
    foods.push(food.chomp)
  end

  # Removes the specified food from the 'foods' array
  def remove_food(food)
    foods.delete(food)
  end

  # Returns the number of foods for this LogItem
  def number_of_foods
    @foods.length
  end

  # Returns whether or not the foods array contains the specified food
  def has_food?(food)
    @foods.include?(food)
  end

  # Writes this LogItem to the specified file. Does NOT close the file
  def write_to_file(file)
    file.write("#{date}")
    foods.each do |food|
      file.write(",#{food}")
    end
    file.write("\n")
  end

  attr_reader :foods, :date


end