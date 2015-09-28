=begin

  Kyler Brown
  Ruby Diet Manager Project
  SWEN 250 Section 01
  Project Created on 9/18/2015

  - This is the main driver class for the Diet Manager

=end

require_relative 'FoodDB.rb'
require_relative 'BasicFood.rb'
require_relative 'Recipe.rb'
require_relative 'Log.rb'
require_relative 'MyDate.rb'

  # Initialize the Food Database and Recipe Database. They both utilize the same class
  foodDatabase = FoodDB.new
  recipeDatabase = FoodDB.new

  # Initialize the Log database
  foodLog = Log.new

  # Trims 'amount' of characters from the beginning of the string
  def trimFromBeginning(string, amount)
    string[0..(amount - 1)] = ''
    return string
  end

  # Capitalizes all words in a string
  def capAll(string)
    return string.gsub(/\w+/, &:capitalize)
  end

  # Returns true if the string contains characters
  def stringNotEmpty(string)
    return string != ''
  end

  # Returns a Date object with the current date
  def getCurrentDate
    time = Time.now
    currentDate = MyDate.new(time.month, time.day, time.year)
    return currentDate
  end

  # Saves all three databases to their respective files.
  # Overwrites whatever is currently in the file with the
  # values that are currently in each database
  def saveToFile(foodDatabase, recipeDatabase, logDatabase)
    foodDBfile = File.open('FoodDB.txt', 'w')
    logDBfile = File.open('DietLog.txt', 'w')

    foodDatabase.database.each_value do |food|
      food.writeToFile(foodDBfile)
    end
    recipeDatabase.database.each_value do |recipe|
      recipe.writeToFile(foodDBfile)
    end
    logDatabase.database.each_value do |logItem|
      logItem.writeToFile(logDBfile)
    end

    # Close each database file to save the written values
    foodDBfile.close
    logDBfile.close
  end

  File.open('DietLog.txt', 'r').each do |line|
    logData = line.split(',')
    # LogData[0] is the date
    # LogData[1..end] is the food(s)
    date = logData[0]
    if logData.length > 2
      # Delete the first two elements of the array
      # Since deleting at 0 would make the second element
      # the new 0, just delete at 0 twice.
      2.times {logData.delete_at(0)}

      logData.each do |foodName|
        foodLog.add(date,foodName)
      end
    else
      foodLog.add(date, logData[1])
    end
  end

  File.open('FoodDB.txt', 'r').each do |line|
    foodData = line.split(',')
    # FoodData[0] is the Food Name
    # FoodData[1] is 'b' for BasicFood, 'r' for Recipe
    # FoodData[2] is the calorie count

    if foodData[1] == 'b'
      food = BasicFood.new(foodData[0], foodData[2].chomp)
      foodDatabase.add(food)
    elsif foodData[1] == 'r'
      recipeName = foodData[0]
      # Removes the name and 'r' from the food data
      foodData.shift(2)
      foods = Array.new

      # Add food objects to the foods array
      foodData.each do |foodIterator|
        food = foodDatabase.get(foodIterator.chomp)
        if food != nil
          foods.push(food)
        end
      end

      recipe = Recipe.new(recipeName, foods)
      recipeDatabase.add(recipe)
    end
  end

  # Use while loop so the program will keep asking
  # for input until the user types 'quit'
  puts "Type 'commands' for a list of commands."
  while true
    print 'Enter a command: '
    input = gets.chomp
    case
      ################# print all #################
      when input == 'print all'
        if foodDatabase.notEmpty?
          foodDatabase.printAll('foods')
          else puts "\nNo foods were found"
        end

        if recipeDatabase.notEmpty?
          puts ''
          recipeDatabase.printAll('recipes')
          else puts "\nNo recipes were found"
        end

      ################# find {prefix} #################
      when input.start_with?('find')
        prefix = trimFromBeginning(input, 5)
        if stringNotEmpty(prefix)
          foodDatabase.find(capAll(prefix))
        else puts "Incorrect format. Try 'find {prefix}'"
        end

      ################# print {name} #################
      when input.start_with?('print')
        name = trimFromBeginning(input, 6)
        name = capAll(name)
        if foodDatabase.contains?(name)
          food = foodDatabase.get(name)
          food.print
        elsif recipeDatabase.contains?(name)
          recipe = recipeDatabase.get(name)
          recipe.print
        elsif name == ''
          puts "Incorrect format. Try 'print {recipe|food}'"
        else puts "'#{name}' was not found"
        end


      ################# new food {name},{calories} #################
      when input.start_with?('new food')
        input = trimFromBeginning(input, 9)
        if stringNotEmpty(input)
          foodData = input.split(',')
          foodData[0] = capAll(foodData[0])

          # If the food doesn't exist
          if !foodDatabase.contains?(foodData[0])
            if foodData.length == 2
              foodDatabase.add(BasicFood.new(foodData[0], foodData[1]))
              puts "Added #{foodData[0]} to database"
            else puts "Not enough arguments. Try 'new food {name} {calories}'"
            end
          else puts 'That food already exists!'
          end
        else puts "Incorrect format. Try 'new food {name} {calories}'"
        end

      ################# new recipe {name},{food_1},{food_2}... #################
      when input.start_with?('new recipe')
        recipeData = trimFromBeginning(input, 11).split(',')

        if recipeData.length >= 2
          recipeName = capAll(recipeData[0])

          # If the recipe doesn't exist, proceed
          if !recipeDatabase.contains?(recipeName)

            # Removes first element from array (the recipe name)
            recipeData.shift

            # Array of food objects. Will be used to pass into the new recipe constructor if all foods exist
            foodObjects = Array.new
            recipeData.each do |foodIterator|
              food = capAll(foodIterator)
              if foodDatabase.contains?(food)
                foodObjects.push(foodDatabase.get(food))
              else puts "'#{food}' was not found. Try creating it first with 'new food {name},{calories}'"
              end
            end

            # If all of the food names passed in were valid foods, then create the recipe
            if recipeData.length == foodObjects.length
              recipeDatabase.add(Recipe.new(recipeName, foodObjects))
              puts "Added recipe #{recipeName} to database"
            end

          else puts 'That recipe already exists!'
          end
        else puts "Incorrect format. Try 'new recipe {name} {food_1} {food_2} ...'"
        end

      ################# log {food_name} #################
      when input.start_with?('log')
        logData = trimFromBeginning(input,4)
        logData = capAll(logData)
        logDataArray = logData.split(',')
        foodName = logDataArray[0]

        if foodDatabase.does_not_contain?(foodName)
          puts "'#{foodName}' was not found. Try creating it first with 'new food {name},{calories}'"
          next
        end
        # If the user typed in a date
        if logDataArray.length > 1
          date = logDataArray[1]
          foodLog.add(date, foodName)
          puts "Added #{foodName} to the log for #{date}"
          next
        end

        # If the user only typed in a food, use current date
        foodLog.add(getCurrentDate.to_s, foodName)
        puts "Added #{foodName} to today's log"

      ################# delete #################
      when input.start_with?('delete')
        input = trimFromBeginning(input,7)
        input = capAll(input)
        data = input.split(',')

        # Data[0] is the food name
        # Data[1] is the date
        foodLog.delete(data[1], data[0])

      ################# show #################
      when input == 'show'
        foodLog.printLogForToday

      ################# show all #################
      when input == 'show all'
        foodLog.printAllLogs

      ################# show {date} #################
      when input.start_with?('show')
        date = trimFromBeginning(input,5)
        foodLog.printLogForDate(date)

      ################# save #################
      when input == 'save'
        saveToFile(foodDatabase,recipeDatabase,foodLog)
        puts 'Saved successfully'

      ################# commands #################
      when input == 'commands'
        # TODO print commands

      ################# quit #################
      when input == 'quit'
        saveToFile(foodDatabase,recipeDatabase,foodLog)
        puts 'Saving and quitting...thanks for playing!'
        exit
      else puts 'Invalid command. Type "commands" for a list of commands'
    end
  end
