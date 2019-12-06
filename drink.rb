class Drink
  # attr_reader :name, :price

  def self.milk
    self.new(100, :milk)
  end

  def self.water
    self.new(0, :water)
  end

  def initialize(price, name)
    @name = name
    @price = price
  end
end