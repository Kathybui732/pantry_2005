require "minitest/autorun"
require "minitest/pride"
require "./lib/cook_book"
require "./lib/recipe"
require "./lib/ingredient"
require "./lib/pantry"

class CookBookTest < MiniTest::Test

	def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient1, 4)
    @recipe1.add_ingredient(@ingredient2, 8)
    @cookbook = CookBook.new
	end

	def test_it_exists_with_attributes
		assert_instance_of CookBook, @cookbook
		assert_equal [], @cookbook.recipes
	end

end