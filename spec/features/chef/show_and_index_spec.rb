require 'rails_helper'

RSpec.describe 'As a visitor when visiting chef show page', type: :feature do
  context ' I see name of chef  ' do
    it " link to list of all ingredients" do
    chef_1 = Chef.create!(name: "Bob")
    dish_1 = chef_1.dishes.create!(name: "Steak & Eggs", description: "Very nice")
    ingredient_1 = Ingredient.create!(name: "Steak", calories: 200)
    ingredient_2 = Ingredient.create!(name: "Eggs", calories: 150)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_1.id)
    DishIngredient.create!(dish_id: dish_1.id, ingredient_id: ingredient_2.id)

    visit "/chefs/#{chef_1.id}"
    expect(page).to have_content(chef_1.name)
    click_link "All Ingredients"
    expect(current_path).to eq('/chef/index')
    expect(page).to have_content(ingredient_1.name)
    expect(page).to have_content(ingredient_2.name)

    end
  end
end


  #
  # As a visitor
  # When I visit a chef's show page
  # I see the name of that chef
  # And I see a link to view a list of all ingredients that this chef uses in their dishes
  # When I click on that link
  # I'm taken to a chef's ingredient index page
  # and I can see a unique list of names of all the ingredients that this chef uses
