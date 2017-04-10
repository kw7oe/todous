class Tasks::GraphController < ApplicationController
  before_action :authenticate_user!
  include Tasks::GraphHelper
  
  def index
    hash = data_for(params[:option], params[:period])
    label = hash[:label]
    colors = color_for(params[:type], label.size)
    @data = {
      labels: label,
      datasets: [
        {
            label: "Tasks",
            backgroundColor: colors,
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
