class TodosController < ApplicationController
  before_action :require_login
  before_action :set_todo, only: %i[ show edit update destroy ]

  def index
    @todos = current_user.todos.order(created_at: :desc)
  end

  def show
  end

  def new
    @todo = current_user.todos.new(done: false)
  end

  def edit
  end

  def create
    @todo = current_user.todos.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: "Todo was successfully created." }
        format.json { render :show, status: :created, location: @todo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(helpers.dom_id(@todo),
                                                   partial: "todos/todo",
                                                   locals: { todo: @todo })
        end

        format.html { redirect_to @todo, notice: "Todo was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @todo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo.destroy!

    respond_to do |format|
      format.html { redirect_to todos_path, notice: "Todo was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:description, :due_date, :done)
  end
end