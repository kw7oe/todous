module ApplicationHelper

  def render_navigation_bar
    content_for :navigation_bar do 
      render "layouts/navigation_bar" 
    end
  end

  def user 
    @user || current_user
  end

  # View Helper
  def graph_link_to(string)
    title = string.titleize
    array = string.split(" ")
    option = array[0]
    period = "current"
    if array.length == 2 
      option = array[1]
      period = array[0]
    end
    class_name = get_class_name(option, period)    
    content_tag(:li, class: class_name) do 
      link_to title, tasks_graph_index_path({
        "option": option,
        "period": period,
      })
    end 
  end

  private 
  def get_class_name(option, period)
    class_name = ""
    if params[:option] == option && params[:period] == period
      class_name = "active"
    end
    return class_name
  end
end
