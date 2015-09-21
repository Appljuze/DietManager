require_relative 'FoodDB.rb'
require_relative 'BasicFood.rb'

class Main

  #Initialize the Food Database
  foodDatabase = FoodDB.new()

  File.open('FoodDB.csv', 'r').each() do |line|
    foodData = line.split(',')
    # FoodData[0] is the Food Name
    # FoodData[1] is 'b' for BasicFood, 'r' for Recipe
    # FoodData[2] is the calorie count

    if foodData[1] == 'b'
      food = BasicFood.new(foodData[0], foodData[2].chomp)
      foodDatabase.addFood(food)
    elsif foodData[1] == 'r'
      # TODO handle recipe input
      else puts 'Invalid character. Accepted characters are "r" and "b".'
    end
  end

  input = gets().chomp()
  case input
    when 'print all'
      foodDatabase.printAll()
    when 'quit'
      puts 'Quitting... thanks for playing!'
      exit
    when 'commands'
      # TODO handle "commands"
    else puts 'Invalid command. Type "commands" for a list of commands'
  end
end
