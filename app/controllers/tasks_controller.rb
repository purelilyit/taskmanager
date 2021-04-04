class TasksController < ApplicationController
  def index
    @message = "Simple Task Manager App"
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: "Task was successfully added." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
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

private
  def task_params
    params.require(:task).permit(:title, :next)
  end
end
