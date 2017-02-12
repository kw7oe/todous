class TasksController < ApplicationController

	def create
		user = User.find(params[:user_id])
		@task = user.tasks.build(task_params)

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
		@task = Task.find(params[:task_id])
		@task.destroy
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
	end

	def done 
		@task = Task.find(params[:id])
		@task.done
		respond_to do |format|
			format.html { redirect_to root_path }
			format.js
		end
	end
	
	private

	def task_params
		params.require(:task).permit(:name)
	end
end
