require 'rails_helper'
require 'spec_helper'

feature 'User authorization', type: :feature do
  def user_sign_up(email, password, password_confirmation = password)
    visit '/users/sign_up'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password_confirmation
    click_button 'Sign up'
  end

  scenario 'A new user signs up with valid data' do
    user_sign_up('test@email.com', 'top-secret')
    expect(page).to have_content 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
    # Check if mail is sent -> mailer
    # expect(ActionMailer::Base.deliveries.count).to eq 1
  end

  scenario 'A new user signs up with invalid data' do
    user_sign_up('test@email.com', 'short')
    expect(page).to have_content 'Password is too short'

    user_sign_up('test@email.com', 'longenough', 'longenough2')
    expect(page).to have_content 'Password confirmation doesn\'t match Password'

    user_sign_up('testemail', 'longenough')
    expect(page).to have_content 'Email is invalid'
  end
end
