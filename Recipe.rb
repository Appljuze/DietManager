require_relative 'BasicFood.rb'

class Recipe

  def initialize(name, foods)
    @name = name
    @foods = foods
    @calories = 0
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