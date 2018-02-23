class TodosController < ApplicationController
	before_action :set_todo, only: [:show, :edit, :update, :destroy]

	def index
		@todos = Todo.all
	end

	def show
	end

	def edit
	end

	def new
		@todo = Todo.new
		@categories = Category.all
	end

	def create
		@todo = Todo.new(todo_params)

		if @todo.save
			redirect_to todos_path
		else
			render 'new'
		end
	end

	def update
		
		if @todo.update(todo_params)
			redirect_to @todo
		else
			render 'edit'
		end
	end

	def destroy
    	@todo = Todo.find(params[:id])
		@todo.destroy
		redirect_to todos_path
	end


	private
	def set_todo
		@todo = Todo.find(params[:id])
	end

	def todo_params
		params.require(:todo).permit(:category_id, :description, :level)
	end
end

