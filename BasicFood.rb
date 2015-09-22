class BasicFood

  def initialize(name, calories)
    @name = name
    @calories = calories.to_i
  end

  def print
    puts "- #{name} : #{calories} calories"
  end

  # Prints with indentation. Used for printing a recipe
  def recipePrint
    puts "   | #{name} : #{calories} calories"
  end

  def writeToFile(file)
    file.write("#{name},b,#{calories}\n")
  end

  attr_accessor :name, :calories
end