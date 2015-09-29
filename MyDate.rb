=begin

  Kyler Brown
  Ruby Diet Manager Project
  SWEN 250 Section 01
  Project Created on 9/18/2015

  - This class is just a small class used
    for representing the date

=end

require 'time'

class MyDate

  # Initializes the Date object with the given month, day and year
  def initialize(month, day, year)
    @month = month
    @day = day
    @year = year
  end

  # Just another way to call to_s. Makes reading the code easier in some cases
  def print
    puts to_s
  end

  # Overrides the to_s method to make it print a formatted version of the date
  def to_s
    return "#{@month}/#{@day}/#{@year}"
  end

  # Uses the time class to get the current date
  def self.today
    time = Time.now
    return "#{time.month}/#{time.day}/#{time.year}"
  end

  attr_reader :month, :day, :year

end