class PagesController < ApplicationController
  def home
    @render_path = "tasks/todo_tasks"
  end
end
