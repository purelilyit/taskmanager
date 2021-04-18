class ApplicationController < ActionController::Base

  def create_completed_task(done_task)
    # puts ">>>>>>>>>>>>> #{@task.title }"
    @completed_task = done_task

    respond_to do |format|
      if @completed_task.save
        format.html { redirect_to tasks_path, notice: "Task has been completed." }
      else
        format.html { render :index, status: :unprocessable_entity }
      end
    end

    @just_completed_task = 1 #flag needed to avoid redirect_to multiple times issue
  end
end
