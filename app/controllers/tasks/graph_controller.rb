class Tasks::GraphController < ApplicationController

  def index
  	hash = Tasks::GraphHelper.data_for(params[:format])
  	label = hash[:label]
  	@data = {
		  labels: label,
		  datasets: [
		    {
		        label: "Task",
		        background_color: "rgba(220,220,220,0.2)",
		        border_color: "rgba(220,220,220,1)",
		        data: hash[:data]
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
