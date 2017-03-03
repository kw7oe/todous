class Tasks::GraphController < ApplicationController
  
  def index
  	hash = Task.this_week.group("date(done_at)").count
  	label = hash.map { |k, v| k.strftime("%A") }
  	data = hash.map {|k, v| v }
  	@data = {
		  labels: label,
		  datasets: [
		    {
		        label: "Task",
		        background_color: "rgba(220,220,220,0.2)",
		        border_color: "rgba(220,220,220,1)",
		        data: data
		    }
		  ]
		}
  	@options = { 
  			class: "graph",
				width: 5,
				height: 1
  	}
  end

end
