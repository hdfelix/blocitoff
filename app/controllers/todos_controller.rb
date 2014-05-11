class TodosController < ApplicationController
respond_to :html, :js
	def index
		@todos = Todo.all
		@todo = Todo.new
		authorize @todos
		
	end

	def new
		@todo = Todo.new
		authorize @todo
	end

	def show
		@todo = Todo.find params[:id]
		authorize @todo
	end

	def create
		@todo = current_user.todos.build(todo_params)
		authorize @todo
		if @todo.save
			flash[:notice] = "Your new TODO was saved."
			redirect_to todos_path
		else
			flash[:error] = "Could not save the TODO."
			render :index
		end
	end

	def destroy
		@todo = Todo.find params[:id]
		authorize @todo
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
