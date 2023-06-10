require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456', password_confirmation: '123456')
  end

  it 'should be a valid user' do
    expect(@user).to be_valid
  end

  it 'should not be valid with name equal to nil' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'should not be valid with email equal to nil' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'should not be valid with passowrd equal to nil' do
    @user.password = nil
    expect(@user).to_not be_valid
  end
end
