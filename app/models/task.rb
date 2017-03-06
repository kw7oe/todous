class Task < ApplicationRecord
  belongs_to :user

 
  def self.done_for(date) 
    # Should be change to a range.
    where("done_at >= ?", date)
  end

  def done
  	update_columns(completed: true)
  	update_columns(done_at: DateTime.current)
  end

  def status 
  	completed ? "done" : "incompleted"
  end
end
