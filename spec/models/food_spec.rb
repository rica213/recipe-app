require 'rails_helper'

RSpec.describe Food, type: :model do
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456', password_confirmation: '123456')
    @food = Food.create(name: 'beans', measurement_unit: 'percs', price: 12, quantity: 22, user_id: @user.id)
  end
  
  it 'should create new food' do
    expect(@food).to be_valid
  end

  it 'should not be valid without a name' do
    @food.name = nil
    expect(@food).to_not be_valid
  end

  it 'should not be valid if user id is nil' do
    @food.user_id = nil
    expect(@food).to_not be_valid
  end
end
