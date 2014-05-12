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

	#To review with Rose on 5/11/14
	describe 'POST #create' do
		before :each do
			@user = login_user
			@todo = build(:todo)
			@todo.user = @user
			@todo.save
		end 
		context 'with valid attributes' do
			it "saves the new todo item in the database" do
				#binding.pry
				expect{ 
					post :create, id: @todo
				}.to change(Todo, :count).by(1)
			end

			it "redirects to todos#index" do
				post :create, id: @todo
				expect(response).to redirect_to todos_path(assigns[:todo])
			end
		end

		#context 'with invalid attributes' do
		#	it "does not save the new contact in the database" do
		#		expect{
		#			post :create,
		#				todo: attributes_for(:invalid_todo)
		#		}.to_not change(Todo, :count)
		#	end
		#	it "displays an error message"
		#end
	end

	describe 'DELETE #destroy' do

		it 'deletes the todo item from the database' do
			expect{
				delete :destroy, id: @todo
			}.to change(Todo, :count).by(-1)
		end

		it 'redirects to todos#index' do
			delete :destroy, id: @todo
			expect(response).to render_template :index
		end
	end
end
