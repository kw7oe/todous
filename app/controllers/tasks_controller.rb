class TasksController < ApplicationController
  before_action :set_user, only: [:index, :create]
  before_action :set_task, only: [:done, :destroy]
  before_action :authenticate_user!

  def index
    @render_path = "tasks/todo_tasks"
    @tasks = current_user.incompleted_tasks.paginate(:page => params[:page]) 
    if params[:option] == "done"
      @tasks = current_user.done_tasks.paginate(:page => params[:page]).order(done_at: :desc)
      @render_path = "tasks/done_tasks"
    end
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
    rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The user you were looking for could not be found."
    redirect_to root_path
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name)
  end
end
