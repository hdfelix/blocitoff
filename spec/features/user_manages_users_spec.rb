require 'spec_helper'

feature 'User accesses site' do
	scenario 'And can see the home page' do
		visit root_path
		expect(page).to have_content('Blocitoff')
	end

	scenario 'And signs in' do
		user = create(:user).skip_confirmation!
		user.confirm!
		sign_in(user)
	save_and_open_page
		expect(page).to have_content('Signed in successfully.')
	end
end
