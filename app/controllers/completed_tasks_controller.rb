class CompletedTasksController < ApplicationController
  def index
    @completed_tasks = CompletedTask.all
  end

  def new
    @completed_task = CompletedTask.new
  end

  def create
  end

  def destroy
    @completed_task = CompletedTask.find(params[:id])
    @completed_task.destroy
    redirect_to completed_tasks_path
  end

end
