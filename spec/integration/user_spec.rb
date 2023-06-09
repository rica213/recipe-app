require 'rails_helper'

RSpec.describe 'Food', type: :feature do
  before(:each) do
    @user = User.create(name: 'Isaac', email: 'kaplan@gmail.com', password: '123456',
                        password_confirmation: '123456')
  end

  describe 'sign in page' do
    it 'should have a sign in page' do
      visit new_user_session_path
      expect(page).to have_content('Log in')
    end

    it 'should have a form for signing in' do
      visit new_user_session_path
      expect(page).to have_content('Email')
      expect(page).to have_content('Password')
    end

    it 'should have a sign up link' do
      visit new_user_session_path
      expect(page).to have_content('Sign up')
    end

    it 'should have a forgot password link' do
      visit new_user_session_path
      expect(page).to have_content('Forgot your password')
    end

    it 'should show sign up link' do
      visit new_user_session_path
      expect(page).to have_link('Sign up')
    end

    it 'should show forgot password link' do
      visit new_user_session_path
      expect(page).to have_link('Forgot your password')
    end

    it 'should log in with credentials' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(current_path).to match('/')
    end

    it 'should have form text' do
      visit new_user_session_path
      expect(page).to have_content('Remember me')
    end

    it 'should redirect to forgot password page' do
      visit new_user_session_path
      click_link 'Forgot your password?'
      expect(current_path).to match(new_user_password_path)
    end

    it 'should show content for forgot password page' do
      visit new_user_password_path
      expect(page).to have_content('Forgot your password')
      expect(page).to have_content('Email')
      expect(page).to have_button('Send me reset password instructions')
      expect(page).to have_content('Log in')
      expect(page).to have_content('Sign up')
    end
  end
end
