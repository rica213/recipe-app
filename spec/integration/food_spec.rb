require 'rails_helper'

RSpec.describe 'Food', type: :feature do
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

    describe 'Test for food page' do
        it 'should have food contents' do
            visit foods_path
            expect(page).to have_content(@food.name)
            expect(page).to have_content(@food.measurement_unit)
            expect(page).to have_content(@food.price)
            expect(page).to have_content(@food.quantity)
            expect(page).to have_content('Delete')
        end

        it 'should create new food' do
            visit new_food_path
            fill_in 'Name', with: 'Porridge'
            fill_in 'Measurement unit', with: 'kg'
            fill_in 'Price', with: 12
            fill_in 'Quantity', with: 22
            click_button 'Create Food'
            expect(page).to have_content('Porridge')
        end

        it 'should have a delete button' do
            visit foods_path
            expect(page).to have_content('Delete')
        end
    end


end