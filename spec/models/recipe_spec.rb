require 'rails_helper'

RSpec.describe Recipe, type: :model do
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456', password_confirmation: '123456')
    @recipe = Recipe.create(name: 'vanilla', preparation_time: 1, cooking_time: 2, description: 'One of a kind',
                            public: true, user_id: @user.id)
  end

  it 'should be a valid recipe' do
    expect(@recipe).to be_valid
  end

  it 'should not be valid without name' do
    @recipe.name = nil
    expect(@recipe).to_not be_valid
  end

  it 'should be valid with preparation time greater than zero' do
    @recipe.preparation_time = 1
    expect(@recipe).to be_valid
  end

  it 'should not be valid with preparation time equal to zero' do
    @recipe.preparation_time = 0
    expect(@recipe).to_not be_valid
  end

  it 'should be valid with cooking time greater than zero' do
    @recipe.cooking_time = 1
    expect(@recipe).to be_valid
  end

  it 'should not be valid with cooking time equal or less than zero' do
    @recipe.cooking_time = -1
    expect(@recipe).to_not be_valid
  end

  it 'should not be valid without description' do
    @recipe.description = nil
    expect(@recipe).to_not be_valid
  end
end
