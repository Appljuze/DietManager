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

  def printAll(recipeOrFood)
      puts "Current #{recipeOrFood} in the database:\n"
    @database.each_value do |food|
      food.print
    end
  end

  def find(prefix)
    @database.each_value do |food|
      if food.name.start_with?(prefix)
        food.print
      end
    end
  end

  attr_reader :database

end