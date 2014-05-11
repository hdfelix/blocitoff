require 'spec_helper'
include ControllerMacros

describe TodosController do

	describe 'GET #index' do
		it 'it populates an array of contacts' do
			create(:todo, description: 'First todo') #ask about my use of 'to exist'
			create(:todo, description: 'Second todo')
			get :index
			expect(assigns(:todos)).to exist 
		end
	end

	describe 'POST #create' do
		before :each do
			@user = login_user
			@todo = build(:todo)
			@todo.user = @user
			@todo.save
		end 
		context 'with valid attributes' do
			it "saves the new todo item in the database" do
				binding.pry
				expect{ 
					post :create, id: @todo
				}.to change(Todo, :count).by(1)
			end

			it "redirects to todos#index" do
				post :create, id: @todo
				expect(response).to redirect_to todos_path(assigns[:todo])
			end
		end

		context 'with invalid attributes' do
			it "does not save the new contact in the database"
			it "displays an error message"
		end
	end

	#describe 'DELETE #destroy' do
	#	ControllerMacros::login_user

	#	it 'deletes the todo item from the database' do
	#		@todo = create(:todo, user_id: subject.current_user.id)
	#		expect{
	#			delete :destroy, id: @todo
	#		}.to change(Todo, :count).by(-1)
	#	end

	#	it 'redirects to todos#index' do
	#		@todo = create(:todo, user_id: subject.current_user.id)
	#		delete :destroy, id: @todo
	#		expect(response).to redirect_to todos_url
	#	end
	#end
end
