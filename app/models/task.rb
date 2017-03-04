class Task < ApplicationRecord
  belongs_to :user

 
  def self.done_from(range) 
    where("done_at >= ?", range)
  end

  def done
  	update_columns(completed: true)
  	update_columns(done_at: DateTime.current)
  end

  def status 
  	completed ? "done" : "incompleted"
  end
end
