require 'spec_helper'

feature 'User accesses site' do

  scenario 'And can see the home page' do
    visit root_path
    expect(page).to have_content('Blocitoff')
  end

  scenario 'And signs in' do
    user = create(:user)
    user.skip_confirmation!
    user.save

    visit root_path

    click_link 'Sign in'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content('Signed in successfully.')
  end
end
