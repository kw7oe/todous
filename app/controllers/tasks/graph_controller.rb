class Tasks::GraphController < ApplicationController
  before_action :authenticate_user!
  include Tasks::GraphHelper
  

  # TODO: Handle more chart
  def index
    hash = data_for(params[:option], params[:period])
    label = hash[:label]
    @data = {
      labels: label,
      datasets: [
        {
            label: "Tasks",
            backgroundColor: "rgba(36, 59, 85, 0.7)",
            data: hash[:data]
        }
      ]
    }
    @options = { 
        class: "graph",
        width: 5,
        height: 3
    }
    @type =  params[:type] || "bar"
  end
end
