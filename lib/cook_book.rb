class CookBook
  attr_reader :recipes
              # :ingredients

  def initialize
    @recipes = []
    # @ingredients = []
  end

  def add_recipe(recipe)
    @recipes << recipe
    # recipe.ingredients.each do |ingredient|
    #   @ingredients << ingredient.name unless @ingredients.include?(ingredient.name)
    # end
    # This gives add_recipe 2 jobs whcih we don't want
  end

  def ingredients
    # ingredients = []
    ingredient_objects = @recipes.flat_map do |recipe|
      recipe.ingredients
    end
    # ingredient_objects.each do |ingredient|
    #   ingredients << ingredient.name unless ingredients.include?(ingredient.name)
    # end
    # ingredients
    ingredient_objects.reduce([]) do |acc, ingredient|
      acc << ingredient.name unless acc.include?(ingredient.name)
      acc
    end

  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end
end
