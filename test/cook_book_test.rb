require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/cook_book"
require "./lib/recipe"
require "./lib/ingredient"
require "./lib/pantry"

class CookBookTest < MiniTest::Test

	def setup
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
    @recipe1 = Recipe.new("Mac and Cheese")
    @recipe2 = Recipe.new("Cheese Burger")
    @cookbook = CookBook.new
    @pantry = Pantry.new
	end

	def test_it_exists_with_attributes
		assert_instance_of CookBook, @cookbook
	end

  def test_recipies_starts_empty_until_added
    assert_equal [], @cookbook.recipes
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    assert_equal [@recipe1, @recipe2], @cookbook.recipes
  end

  def test_ingredients
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
		# assert_equal [@ingredient1, @ingredient2, @ingredient3, @ingredient4], @cookbook.ingredients
    assert_equal ["Cheese", "Macaroni", "Ground Beef", "Bun"], @cookbook.ingredients
  end

  def test_highest_calorie_meal
    @recipe1.add_ingredient(@ingredient1, 2)
    @recipe1.add_ingredient(@ingredient2, 8)
    @recipe2.add_ingredient(@ingredient1, 2)
    @recipe2.add_ingredient(@ingredient3, 4)
    @recipe2.add_ingredient(@ingredient4, 1)
    @cookbook.add_recipe(@recipe1)
    @cookbook.add_recipe(@recipe2)
    assert_equal @recipe2, @cookbook.highest_calorie_meal
  end

  def test_cook_book_date
		# @cookbook.stubs(:today).returns("%m-%d-%Y")
		Date.stubs(:today).returns(Date.new(2020,6,3))
		assert_equal "06-03-2020", @cookbook.date

  end

  def test_cook_book_summary
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 1 })
    cookbook = CookBook.new
    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Burger")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    recipe2.add_ingredient(ingredient3, 4)
    recipe2.add_ingredient(ingredient4, 100)
    cookbook.add_recipe(recipe1)
    cookbook.add_recipe(recipe2)
    expected = [{
      :name=>"Mac and Cheese",
      :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"},
                                {:ingredient=>"Cheese", :amount=>"2 C"}],
                  :total_calories=>440}},
                {
      :name=>"Burger",
      :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"},
                                {:ingredient=>"Bun", :amount=>"100 g"}],
                  :total_calories=>500}}]
    assert_equal expected, cookbook.summary
  end
end
