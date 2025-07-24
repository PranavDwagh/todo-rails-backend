class Api::TodosController < ApplicationController
  before_action :set_todo, only: %i[ show edit update_completed destroy ]
  skip_before_action :verify_authenticity_token
  # GET /todos or /todos.json
  def index
    @todos = Todo.all
    render json: @todos
  end

  # GET /todos/1 or /todos/1.json
  def show
  end

  # GET /todos/new
  def new
    @todo = Todo.new
  end

  # GET /todos/1/edit
  def edit
  end

  # POST /todos or /todos.json
  def create
    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1 or /todos/1.json
  def update_completed
    if @todo.update(completed: params[:completed])
      render json: @todo, status: :ok
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1 or /todos/1.json
  def destroy
    @todo.destroy!

    render json: @todo, status: :ok
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_todo
    @todo = Todo.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def todo_params
    params.require(:todo).permit(:todo_name, :completed)
  end
end
