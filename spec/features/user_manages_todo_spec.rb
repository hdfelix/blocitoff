require 'spec_helper'

feature 'User can manage Todo items' do
  let(:authed_user) {     
    create_logged_in_user 
  }

  scenario 'by accessing the Todo index' do
    visit todos_path(authed_user)
    expect(page).to have_content("My List")
  end

  scenario 'Can see the Todo list headers' do
    visit todos_path(authed_user)
    expect(page).to have_content('Description')
    expect(page).to have_content('Days left')
    expect(page).to have_content('Complete')
  end
end

feature 'User creates Todo item' do
  let(:authed_user) {     
    @user = create_logged_in_user 
    @todo = Todo.create(description: 'Test my app')
  }

  scenario 'Successfully' do
    visit todos_path(authed_user)
    expect{
      fill_in 'todo_description', with: 'Meet up with the team'
      click_button 'Save'
    }.to change(Todo, :count).by (1)
    expect(page).to have_content('Meet up with the team')
    expect(page).to have_content('days')    
  end

  scenario 'sees \'SUCCESS\' message when saved' do
    visit todos_path(authed_user)
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect(page).to have_content('Your new TODO was saved.')
  end

  scenario 'invalid with \'Description\' missing' do
    visit todos_path(authed_user)
    expect{click_button 'Save'}.to change(Todo, :count).by (0)
    expect(page).to have_content("can't be blank")
  end
end
