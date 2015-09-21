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
  def getFood(name)
    return @database[name]
  end

  def printAll()
    puts "Current foods in the database:\n"
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

end