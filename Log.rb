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

  # Returns true if the logItem exists in the database
  def contains?(logItem)
    @database.has_key?(logItem)
  end

  attr_reader :database

end