require 'rails_helper'

RSpec.describe 'Recipe', type: :feature do
    before(:each) do
        @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456', password_confirmation: '123456')
        @recipe = Recipe.create(name: 'vanilla', preparation_time: 1, cooking_time: 2, description: 'One of a kind', public: true, user_id: @user.id)
        @food = Food.create(name: 'beans', measurement_unit: 'percs', price: 12, quantity: 22, user_id: @user.id)
        @recipe_food = RecipeFood.create(quantity: 30, food_id: @food.id, recipe_id: @recipe.id)

        visit new_user_session_path
        fill_in 'Email', with: @user.email
        fill_in 'Password', with: @user.password
        click_button 'Log in'
    end

    describe 'Test functionality for recipe' do

        it 'should create a new recipe' do
            visit new_recipe_path
            fill_in 'Name', with: @recipe.name
            fill_in 'Preparation time', with: @recipe.preparation_time
            fill_in 'Cooking time', with: @recipe.cooking_time
            fill_in 'Description', with: @recipe.description
            click_button 'Create Recipe'
            expect(page).to have_content(@recipe.name)
        end

        it 'should show text for adding new recipe' do
            visit new_recipe_path
            expect(page).to have_content('Add New Recipe')
        end

        it 'page should contain remove button' do
            visit recipes_path
            expect(page).to have_content('Remove')
        end

        it 'should redirect to recipe show page' do
            visit recipes_path
            click_link 'vanilla'
            expect(current_path).to match(recipe_path(@recipe.id))
        end

        it 'should show recipe details' do
            visit recipe_path(@recipe.id)
            expect(page).to have_content(@recipe.name)
        end

        it 'should contain button to generate shop list' do
            visit recipe_path(@recipe.id)
            expect(page).to have_content('Generate Shop List')
        end

        it 'should contain button to add ingredient' do
            visit recipe_path(@recipe.id)
            expect(page).to have_content('Add Ingredient')
        end

        it 'should change the status public of recipe' do
            visit recipe_path(@recipe.id)
            click_link 'Make Private'
            expect(@recipe.public).to be true
        end

    end

end