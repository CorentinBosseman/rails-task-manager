class TasksController < ApplicationController

  def index
    @tasks = Task.all # With ActiveRecord
  end

  def show
  # path example: '/tasks/1' (where 1 is the id of the restaurant)
  # params
  # => { 'id' => '1' }
    @task = Task.find(params[:id]) # With ActiveRecord
  # rescue ActiveRecord::RecordNotFound
  #   render #custom 404
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    @task.save
    redirect_to task_path(@task)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def destroy
    @task = Task.find(params[:id])

    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
