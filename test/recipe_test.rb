require "minitest/autorun"
require "minitest/pride"
require "./lib/ingredient"
require "./lib/recipe"

class RecipeTest < MiniTest::Test

	def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
	end

	def test_it_exists_with_attributes
		assert_instance_of Recipe, @recipe
    assert_equal "Mac and Cheese", @recipe1.name
	end

end
