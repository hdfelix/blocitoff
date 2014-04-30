require 'spec_helper'

describe TodosController do
	describe 'GET #index' do
		it 'it populates an array of contacts' do
			create(:todo, description: 'First todo') #ask about my use of 'to exist'
			create(:todo, description: 'Second todo')
			get :index
			expect(assigns(:todos)).to exist 
		end

		it 'renders the :index view' do
			get :index
			expect(response).to render_template :index
		end
	end

	describe 'DELETE #destroy' do
			before :each do
				@todo = create(:todo)
			end

		it 'deletes the todo item from the database' do
			expect{
				delete :destroy, id: @todo
			}.to change(Todo, :count).by(-1)
		end

		it 'redirects to todos#index' do
			delete :destroy, id: @todo
			expect(response).to redirect_to todos_url
		end
	end
end
