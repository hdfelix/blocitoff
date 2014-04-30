require 'spec_helper'

feature 'User can manage Todo items' do
	@todo = Todo.create(description: 'Test my app')

	scenario 'by accessing the Todo index' do
		visit todos_path
		expect(page).to have_content("My List")
	end

	scenario 'Can see the Todo list headers' do
		visit todos_path
		expect(page).to have_content('Create new todo')
		expect(page).to have_content('Description')
		expect(page).to have_content('Days left')
		expect(page).to have_content('Complete')
	end
	
	scenario 'Can view a single Todo item' do	
		visit todos_path
		expect(page).to have_content('Test my app')
	end

	#scenario 'Can view days left on a todo item' do
		#expect(page).to have_content('days')	
	#end
end

feature 'User creates Todo item' do

	scenario 'Successfully' do
		visit todos_path
		click_link 'Create new todo'
		expect{
			fill_in 'Description', with: 'Meet up with the team'
			click_button 'Save'
		}.to change(Todo, :count).by (1)
		expect(page).to have_content('Meet up with the team')
	end
	scenario 'sees \'SUCCESS\' message when saved' do
		visit new_todo_path
		fill_in 'Description', with: 'Meet up with the team'
		click_button 'Save'
		expect(page).to have_content('Your new TODO was saved.')
	end

	scenario 'invalid with \'Description\' missing' do
		visit new_todo_path
		expect{click_button 'Save'}.to change(Todo, :count).by (0)
		expect(page).to have_content("can't be blank")
	end
end

#feature 'User edits a Todo item' do
#	eodo = Todo.create(description: 'Test my app')
#	
#	scenario 'Successfully' do
#		visit todos_path
#		first(:link, 'Edit').click
#		#expect(current_path).to eq todo
#	end
#
#	scenario 'invalid with \'Description\' missing' do
#	end
#end
#
#feature 'User deletes a Todo item' do
#end

#feature 'User deletes a Todo item' do
#	scenario 'Successfully' do
#		expect{
#			visit todos_path
#			#select Delete button on particular todo
#		}.to_change(Todo, :count).by(-1)
#		
#	end
#end
