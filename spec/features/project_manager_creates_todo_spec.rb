require 'spec_helper'

feature 'Project Manager creates TODO' do
	scenario 'Successfully' do
		visit new_todo_path
		fill_in 'Description', with: 'Meet up with the team'
		click_button 'Save'
		expect(page).to have_content('Your new TODO was saved.')
		expect(page).to have_content('Meet up with the team')
	end

	scenario 'With \'Description\' missing' do
		visit new_todo_path
		expect{click_button 'Save'}.to change(Todo, :count).by (0)
		expect(page).to have_content("can't be blank")
		#expect(page).to have_content('Could not save the TODO.')	
	end
end

