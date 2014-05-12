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
				expect{ 
					post :create,
						todo: attributes_for(:todo)
				}.to change(Todo, :count).by(1)
			end

			it "redirects to todos#index" do
				post :create,
					todo: attributes_for(:todo)
				expect(response).to redirect_to todos_path#(assigns[:todo])
			end
		end

		context 'with invalid attributes' do
			it "does not save the new contact in the database" do
				expect{
					post :create,
						todo: attributes_for(:invalid_todo)
				}.to_not change(Todo, :count)
			end
			it "displays an error message"
		end
	end

	describe 'DELETE #destroy' do
		before :each do
			@user = login_user
			@todo = build(:todo)
			@todo.user = @user
			@todo.save
		end 

		it 'deletes the todo item from the database' do
			expect{
				delete :destroy, id: @todo.id
			}.to change(Todo, :count).by(-1)
		end

		it 'redirects to todos#index' do
			delete :destroy, id: @todo.id
			expect(response).to redirect_to todos_path
		end
	end
end
