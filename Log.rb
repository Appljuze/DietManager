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

  def printLogForToday
    puts 'Foods for today:'
    foodsForToday = @database[MyDate.today].foods
    if foodsForToday != nil
      foodsForToday.each do |foodName|
      puts "  - #{foodName}"
      end
    else puts "You haven't entered any foods into today's log"
    end
  end

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

  def printAllLogs
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