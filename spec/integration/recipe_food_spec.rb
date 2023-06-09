require 'rails_helper'

RSpec.describe 'Food', type: :feature do
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456',
                        password_confirmation: '123456')
    @recipe = Recipe.create(name: 'vanilla', preparation_time: 1, cooking_time: 2, description: 'One of a kind',
                            public: true, user_id: @user.id)
    @food = Food.create(name: 'beans', measurement_unit: 'percs', price: 12, quantity: 22, user_id: @user.id)
    @recipe_food = RecipeFood.create(quantity: 30, food_id: @food.id, recipe_id: @recipe.id)

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  describe 'Recipe food page' do
    it 'should have add new ingredient in index page' do
      visit new_recipe_recipe_food_path(@recipe)
      expect(page).to have_content('Add new Ingredient')
    end

    it 'should render add ingredient form' do
      visit new_recipe_recipe_food_path(@recipe)
      expect(page).to have_content('Food name')
      expect(page).to have_content('Quantity')
      expect(page).to have_button('Save')
    end

    it 'should show remove button in recipe show page' do
      visit recipe_recipe_foods_path(@recipe)
      expect(page).to have_content(@recipe.name)
    end

    it 'should show recipe food details' do
      visit recipe_recipe_foods_path(@recipe)
      expect(page).to have_content(@recipe.foods.name)
    end
  end
end
