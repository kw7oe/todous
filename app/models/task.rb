class Task < ApplicationRecord
  belongs_to :user

  def done
    update_columns(completed: true)
    update_columns(done_at: DateTime.current)
  end

  def status 
    completed ? "done" : "incompleted"
  end
end
