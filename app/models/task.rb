class Task < ApplicationRecord
  belongs_to :user

  def done
  	update_columns(completed: true)
  end

  def status 
  	completed ? "done" : "incompleted"
  end
end
