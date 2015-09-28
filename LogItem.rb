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
  def initialize(date, foodName)
    @date = date
    @foods = [foodName.chomp]
  end

  # Adds the specified food to the 'foods' array
  def addFood(food)
    foods.push(food.chomp)
  end

  # Removes the specified food from the 'foods' array
  def removeFood(food)
    foods.delete(food)
  end

  # Returns the number of foods for this LogItem
  def numberOfFoods
    @foods.length
  end

  # Returns whether or not the foods array contains the specified food
  def hasFood?(food)
    @foods.include?(food)
  end

  # Writes this LogItem to the specified file. Does NOT close the file
  def writeToFile(file)
    file.write("#{date}")
    foods.each do |food|
      file.write(",#{food}")
    end
    file.write("\n")
  end

  attr_reader :foods, :date


end