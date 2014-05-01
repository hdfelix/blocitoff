class TodosController < ApplicationController
respond_to :html, :js
	def index
		@todos = Todo.all
		@todo = Todo.new
	end

	def new
		@todo = Todo.new
	end

	def show
		@todo = Todo.find params[:id]
	end

	def create
		@todo = Todo.new(todo_params)
		if @todo.save
			flash[:notice] = "Your new TODO was saved."
			redirect_to todos_path
		else
			flash[:error] = "Could not save the TODO."
			render :new
		end
	end

	def destroy
		@todo = Todo.find(params[:id])
		desc = @todo.description

		if @todo.destroy
			flash[:notice] = "The todo #{desc} was deleted successfully."
		else
			flash[:error] = "There was an error deleting the Todo item"
		end

		respond_with(@todo) do |f|
			f.html { redirect_to todos_path }
		end
	end

	private
	
	def todo_params
		params.require(:todo).permit(:description)
	end
end
