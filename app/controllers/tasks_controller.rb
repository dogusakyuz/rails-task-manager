class TasksController < ApplicationController

  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(params_task)
    @task.save
    redirect_to tasks_path(@tasks)
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(params_task)
    redirect_to tasks_path(@tasks)
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path(@tasks)
  end

  private

  def params_task
    params.require(:task).permit(:name)
  end


end
