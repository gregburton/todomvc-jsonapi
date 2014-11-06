class Api::V1::TodosController < ApplicationController
  def index
    @todos = Todo.all
    render json: @todos
  end

  def show
    @todo =Todo.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @todo }
    end
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created, location: api_v1_todo_path(@todo)
    else
      render @todo.errors, status: :unprocessable_entity
    end
  end

  def update
    @todo = Todo.find(params[:id])

    if @todo.update(todo_params)
      head :no_content
    else
      render @todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    head :no_content
  end

  private

  def todo_params
    params.permit(:title, :order, :completed)
  end
end
