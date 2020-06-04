class Recipe
  attr_reader :name,
              :ingredients_required

  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] ||= 0
    @ingredients_required[ingredient] += amount
  end

  def ingredients
    @ingredients_required.keys
  end

  def ingredient_names
    ingredients.map do |ingredient|
      ingredient.name
    end
  end

  def total_calories
    @ingredients_required.reduce(0) do |acc, (ingredient, amount)|
      acc += (ingredient.calories * amount)
      acc
    end
  end
end
