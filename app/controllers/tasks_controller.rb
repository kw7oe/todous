class TasksController < ApplicationController
  before_action :set_user, only: [:index, :create]
  before_action :set_task, only: [:done, :destroy]

  def index
  end

  def create    
    @task = @user.tasks.build(task_params)

    respond_to do |format|
      if @task.save 
        format.html { redirect_to root_path, notice: "Task added!" }
        format.js
      else
        fotmat.html { render "new" }
      end
    end
  end

  def destroy 
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def done 
    @task.done
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end
  
  private
  def set_user 
    @user = User.find(params[:user_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name)
  end
end
