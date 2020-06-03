require "minitest/autorun"
require "minitest/pride"
require "./lib/pantry"
require "./lib/ingredient"

class  PantryTest < MiniTest::Test

	def setup
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
	end

	def test_it_exists_with_attributes
		assert_instance_of Pantry, @pantry
	end

end
