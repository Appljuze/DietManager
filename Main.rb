require_relative 'FoodDB.rb'
require_relative 'BasicFood.rb'

  # Trims 'amount' of characters from the beginning of the string
def trimFromBeginning(string, amount)
  string[0..(amount - 1)]=''
  return string
  end

  #Initialize the Food Database
  foodDatabase = FoodDB.new()

  File.open('FoodDB.txt', 'r').each() do |line|
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

  while(true)
    input = gets().chomp()
    case
      when input == 'print all'
        foodDatabase.printAll()
      when input.start_with?('find ')
        prefix = trimFromBeginning(input, 5)
        # Capitalize is called to account for lowercase input
        foodDatabase.find(prefix.capitalize!)
      when input.start_with?('print ')
        name = trimFromBeginning(input, 6)
        food = foodDatabase.getFood(name.capitalize!)

        #TODO add ability to print recipes
      when input == 'commands'
        # TODO handle "commands"
      when input == 'quit'
        puts 'Quitting... thanks for playing!'
        exit
      else puts 'Invalid command. Type "commands" for a list of commands'
    end
  end
