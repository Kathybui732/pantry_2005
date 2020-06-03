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

  def ingredient_objects
    @recipes.flat_map do |recipe|
      recipe.ingredients
    end
  end

  def ingredients
    # ingredients = []
    # ingredient_objects = @recipes.flat_map do |recipe|
    #   recipe.ingredients
    # end
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

  def summary
    hash_4 = Hash.new
    array_3 = []
    hash_2 = Hash.new { |hash, key| hash[key] =  }
    array_1 = []
    ingredient_objects.each do |ingredient|
      hash_4[:ingredient] = ingredient.name
      hash_4[:amount] = ingredient.calories.to_s + " " + ingredient.unit
      array_3 << hash_4
    end
    @reciepes.each do |recipe
    end
    #I was trying to build this backwards but it did not work lol
  end
end
