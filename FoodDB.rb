class FoodDB

  # Initialize the database hash
  def initialize()
    @database = Hash.new
  end

  # Add BasicFood object to database
  def addFood(food)
    @database[food.name] = food
  end

  # Gets a BasicFood object from the database from a food name
  def getFood(food)
    return @database[food.name]
  end

  def printAll()
    puts "Current foods in the database:\n"
    @database.each_value do |food|
      puts "- #{food.name} : #{food.calories} calories"
    end
  end

end