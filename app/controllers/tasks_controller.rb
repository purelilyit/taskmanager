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
    @just_completed_task = 0

    @task = Task.find(params[:id])
    # puts ">>>>>>>>>>>>> #{@task.title }"
    completed_task_params = {'title' =>@task.title, 'next' => @task.next}
    @completed_task = CompletedTask.new(completed_task_params)
    create_completed_task(@completed_task)  #create method called directly
    destroy   #destroy method called directly
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])

    respond_to do |format|
      if @task.update(task_params)
        format.html {redirect_to task_path, :notice => "Task was successfully updated."}
      else
        format.html {render :edit, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    if @just_completed_task == 0 #deleting a regular task
      redirect_to tasks_path #in that case we want to refresh the page
    else
      @just_completed_task = 1 #deleting a "done/completed" task, no need to refresh page
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  private
    def task_params
      params.require(:task).permit(:title, :next)
    end
end
