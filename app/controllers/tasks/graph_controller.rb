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
            label: "Tasks",
            backgroundColor: "rgba(20,87,20,1)",
            borderColor: "rgba(20,87,20,1)",
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
