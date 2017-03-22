class Task < ApplicationRecord
  belongs_to :user

  self.per_page = 10

  def done
    update_columns(completed: true)
    update_columns(done_at: DateTime.current)
  end

  def status 
    completed ? "done" : "incompleted"
  end
end
