=begin

  Kyler Brown
  Ruby Diet Manager Project
  SWEN 250 Section 01
  Project Created on 9/18/2015

  - This class is used to test the Recipe class

=end

require 'test/unit'
require './Recipe.rb'

class TestRecipe < Test::Unit::TestCase

  def test_object_creation
    bacon = BasicFood.new('Bacon', 400)
    sausage = BasicFood.new('Sausage', 260)
    eggs = BasicFood.new('Eggs', 200)

    foods = [bacon, sausage, eggs]

    breakfast = Recipe.new('Breakfast', foods)

    assert(breakfast.name == 'Breakfast', 'Name accessor failed')
    assert(breakfast.calories == 860, 'Error in recipe calorie counting')
    assert(breakfast.foods == foods, 'Error in foods assignment, in Recipe constructor')
  end

end