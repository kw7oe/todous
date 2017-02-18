class Task < ApplicationRecord
  belongs_to :user
	scope :this_week, -> { where("done_at >= ?", 7.days.ago) }
	
  def done
  	update_columns(completed: true)
  	update_columns(done_at: DateTime.current)
  end

  def status 
  	completed ? "done" : "incompleted"
  end
end
