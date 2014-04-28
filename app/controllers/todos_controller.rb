class TodosController < ApplicationController

	def index
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
			redirect_to @todo
		else
			flash[:error] = "Could not save the TODO."
			render :new
		end
	end

	private
	
	def todo_params
		params.require(:todo).permit(:description)
	end
end
