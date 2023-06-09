require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456', password_confirmation: '123456')
    @recipe = Recipe.create(name: 'vanilla', preparation_time: 1, cooking_time: 2, description: 'One of a kind',
                            public: true, user_id: @user.id)
    @food = Food.create(name: 'beans', measurement_unit: 'percs', price: 12, quantity: 22, user_id: @user.id)
    @recipe_food = RecipeFood.create(quantity: 30, food_id: @food.id, recipe_id: @recipe.id)
  end

  it 'should be valid recipe_food' do
    expect(@recipe_food).to be_valid
  end

  it 'should not be valid with quantity equal to equal' do
    @recipe_food.quantity = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'should not be valid with quantity less than or equal to zero' do
    @recipe_food.quantity = 0
    expect(@recipe_food).to_not be_valid
  end

  it 'should not be valid when food_id is nil' do
    @recipe_food.food_id = nil
    expect(@recipe_food).to_not be_valid
  end

  it 'should not be valid when recipe_id is nil' do
    @recipe_food.recipe_id = nil
    expect(@recipe_food).to_not be_valid
  end
end
