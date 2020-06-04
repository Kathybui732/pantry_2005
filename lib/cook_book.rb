require "date"

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

  # could extract this to ingredients class because that is it's job
  # def ingredient_objects
  #   @recipes.flat_map do |recipe|
  #     recipe.ingredients
  #   end.uniq!
  # end

  def ingredients
    # ingredients = []
    # ingredient_objects = @recipes.flat_map do |recipe|
    #   recipe.ingredients
    # end
    # ingredient_objects.each do |ingredient|
    #   ingredients << ingredient.name unless ingredients.include?(ingredient.name)
    # end
    # ingredients

    # ingredient_objects.reduce([]) do |acc, ingredient|
    #   acc << ingredient.name unless acc.include?(ingredient.name)
    #   acc
    # end

    # ingredient_objects.map do |ingredient|
    #   ingredient.name
    # end

    @recipes.flat_map do |recipe|
      recipe.ingredient_names
    end.uniq!
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

  def date
    Date.today.strftime("%m-%d-%Y")
  end

  def summary
    @recipes.map do |recipe|
      name = recipe.name
      ingredients = recipe.ingredients_required.sort_by do |ingredient, amount|
        ingredient.calories * amount
      end.reverse.to_h
      ingredients_1 = ingredients.map do |ingredient, amount|
        {:ingredient => ingredient.name, :amount => "#{amount} #{ingredient.unit}"}
      end
      total_calories = recipe.total_calories
      { :name => name,
        :details => { :ingredients => ingredients_1,
                    :total_calories => total_calories} }
    end
  end
end
