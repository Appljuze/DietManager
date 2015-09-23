=begin

  Kyler Brown
  Ruby Diet Manager Project
  SWEN 250 Section 01
  Project Created on 9/18/2015

  - This class is used to create Recipe objects
  - Each Recipe has its own name, and an array of
    foods that belong to that recipe

=end

require_relative 'BasicFood.rb'

class Recipe

  def initialize(name, foods)
    @name = name
    @foods = foods
    @calories = 0

    # Totals up all the calories from the foods array
    foods.each do |food|
      @calories += food.calories
    end
  end

  def print
    puts "- #{name} : #{calories} calories"
    @foods.each do |food|
      food.recipePrint
    end
  end

  def writeToFile(file)
    file.write("#{name},r")
    foods.each do |food|
      file.write(",#{food.name}")
    end
    file.write("\n")
  end

  attr_reader :name, :foods, :calories

end