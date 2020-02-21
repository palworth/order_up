require 'rails_helper'

RSpec.describe  "As a visitor" do
  context 'while visit the dish show page' do
    it 'i see list of ingredients for that dish' do
      chef_1 = Chef.create!(name: "Bob")
      dish_1 = chef_1.dishes.create!(name: "Steak & Eggs", description: "Very nice")
      ingredient_1 = Ingredient.create!(name: "Steak", calories: 200)
      ingredient_2 = Ingredient.create!(name: "Eggs", calories: 150)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
      # require "pry"; binding.pry
      visit "/dish/#{dish_1.id}"
      expect(page).to have_content(dish_1.name)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_1.calories)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_2.calories)

    end
    it 'I see total calories of dish' do
      chef_1 = Chef.create!(name: "Bob")
      dish_1 = chef_1.dishes.create!(name: "Steak & Eggs", description: "Very nice")
      ingredient_1 = Ingredient.create!(name: "Steak", calories: 200)
      ingredient_2 = Ingredient.create!(name: "Eggs", calories: 150)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
      DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)
      # require "pry"; binding.pry
      visit "/dish/#{dish_1.id}"
      expect(page).to have_content(dish_1.name)
      expect(page).to have_content(ingredient_1.name)
      expect(page).to have_content(ingredient_1.calories)
      expect(page).to have_content(ingredient_2.name)
      expect(page).to have_content(ingredient_2.calories)
      expect(page).to have_content(350)
    end
  end
end
