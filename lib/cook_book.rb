class CookBook
  attr_reader :recipes,
              :ingredients

  def initialize
    @recipes = []
    @ingredients = []
  end

  def add_recipe(recipe)
    @recipes << recipe
    recipe.ingredients.each do |ingredient|
      @ingredients << ingredient.name unless @ingredients.include?(ingredient.name)
    end
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end
end
