require 'spec_helper'

feature 'User accesses site' do
	scenario 'And can see the home page' do
		visit root_path
		expect(page).to have_content('Blocitoff')
	end
end

