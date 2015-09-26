=begin

  Kyler Brown
  Ruby Diet Manager Project
  SWEN 250 Section 01
  Project Created on 9/18/2015

  - This class is just a small class used
    for representing the date

=end

class MyDate

  def initialize(month, day, year)
    @month = month
    @day = day
    @year = year
  end

  def print
    puts to_s
  end

  def to_s
    return "#{@month}/#{@day}/#{@year}"
  end

  def self.today
    time = Time.now
    return "#{time.month}/#{time.day}/#{time.year}"
  end

  attr_reader :month, :day, :year

end