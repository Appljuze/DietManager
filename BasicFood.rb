class BasicFood

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def print
    puts "- #{name} : #{calories} calories"
  end

  attr_accessor :name, :calories
end