class Pantry
  attr_reader :stock

  def initialize
    # @stock = {}
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    # if @stock[ingredient].nil?
    #   0
    # else
    #   @stock[ingredient]
    # end
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    # @stock[ingredient] ||= 0
    # @stock[ingredient] += amount
    @stock[ingredient] += amount
  end

  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.all? do |ingredient, amount|
      # if @stock[ingredient].nil?
      #   false
      # else
      #   amount <= @stock[ingredient]
      # end
      amount <= @stock[ingredient]
    end
  end
end
