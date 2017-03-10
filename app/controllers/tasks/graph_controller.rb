class Tasks::GraphController < ApplicationController
  before_action :authenticate_user!
  include Tasks::GraphHelper
  
  def index
    hash = data_for(params[:option], params[:period])
    label = hash[:label]
    @data = {
      labels: label,
      datasets: [
        {
            label: "Tasks Done",
            background_color: "rgba(220,220,220,0.2)",
            border_color: "rgba(220,220,220,1)",
            data: hash[:data]
        }
      ]
    }
    @options = { 
        class: "graph",
        width: 5,
        height: 3
    }
  end
end
