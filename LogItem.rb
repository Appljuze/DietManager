=begin

  Kyler Brown
  Ruby Diet Manager Project
  SWEN 250 Section 01
  Project Created on 9/18/2015

  - This class is used to create LogItem objects
  - Each LogItem will have a food name and a
  and a DateTime object

=end

require 'time'

class LogItem

  def initialize(date, foodName)
    @date = date
    @foods = [foodName]
  end

  def addFood(food)
    foods.push(food)
  end

  def print
    dateString = date.print
    puts dateString.append(foods)
  end

  attr_reader :foods, :date


end