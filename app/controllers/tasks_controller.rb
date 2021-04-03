class TasksController < ApplicationController
  def index
    @message = "Simple Task Manager App"
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    # @task = Task.new(Task_params)
    # if @task.valid?
    #    @task.save
    #    redirect_to task_path(@task)
    # else
    #    render :new
    # end
    render plain: "Form submitted!"
    # render :edit
  end

  def done
    # puts ">>>> >>>>  >>>> #{params[:id]}"
  end

  def edit
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path
  end

  def show
    @task = Task.find(params[:id])
  end
end
