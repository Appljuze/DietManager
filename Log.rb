=begin

  Kyler Brown
  Ruby Diet Manager Project
  SWEN 250 Section 01
  Project Created on 9/18/2015

  - This class will have a database which stores
    a hash for LogItem

=end

require_relative 'MyDate.rb'
require_relative 'LogItem.rb'

class Log

  # Initialize a Hash, which will represent the food database
  def initialize
    @database = Hash.new
  end

  # Adds a food to the LogItem if it exists, and creates
  # the LogItem if it doesn't exist
  def add(date, foodName)
    if @database.has_key?(date)
      @database[date].addFood(foodName)
    else
      @database[date] = LogItem.new(date, foodName)
    end
  end

  # Deletes the specified food from the database, for the specified date
  def delete(date, foodName)
    if @database.has_key?(date)
      if @database[date].hasFood?(foodName)
        @database[date].removeFood(foodName)
        puts "Deleted #{foodName} from the food log for the date '#{date}'"
      else puts "'#{foodName}' has not been added for the date '#{date}'"
      end
    else puts 'That date does not exist in the food log'
    end
    # If the number of foods for that date has dropped to zero, delete the key
    if @database[date].numberOfFoods == 0
      @database.delete(date)
    end
  end

  # Prints the food log for today's date
  def printLogForToday
    puts 'Foods for today:'
    # Use the MyDate class to access today's date
    logForToday = @database[MyDate.today]

    # If a log for today is found in the database (!= nil)
    if logForToday != nil
      foodsForToday = logForToday.foods
      foodsForToday.each do |foodName|
      puts "  - #{foodName}"
      end
    else puts "You haven't entered any foods into today's log"
    end
  end

  # Prints the food log for the specified date
  def printLogForDate(date)
    if @database[date] == nil
      puts 'No foods have been added for that date'
      return
    end
    logItem = @database[date]
    puts "Foods from #{date}:"
    logItem.foods.each do |food|
      puts "  - #{food}"
    end
  end

  # Prints all food logs that currently exist
  def printAllLogs
    if @database.empty?
      puts 'No foods have been added to the food log'
      return
    end
    # Iterates through each date and LogItem and prints the foods for that date
    @database.each do |date,logItem|
      puts "Foods from #{date}:"
      logItem.foods.each do |foodName|
        puts "  - #{foodName}"
      end
    end
  end

  # Returns true if the logItem exists in the database
  def contains?(logItem)
    @database.has_key?(logItem)
  end

  attr_reader :database

end