module ApplicationHelper
  
  def user 
    @user || current_user
  end

  # View Helper
  def render_navigation_bar
    content_for :navigation_bar do 
      render "layouts/navigation_bar" 
    end
  end

  def render_sidebar
    content_for :sidebar do 
      render "layouts/sidebar"
    end
  end

  def tasks_link_to(string) 
    option = string.downcase.gsub(" ", "")
    params = { "option": option }
    link_to user_tasks_path(user, params) do 
      content_tag(:li) { string }
    end
  end

  def graph_link_to(string)
    title = string.titleize
    array = string.split(" ")
    option = array[0]
    period = "current"
    if array.length == 2       
      period = array[0]
      option = array[1]
    end
    class_name = get_class_name(option, period)
    params = {
        "option": option,
        "period": period,
    }
    link_to tasks_graph_index_path(params) do     
      content_tag(:li, class: class_name) { title }
    end
  end

  def options_for(array, selected)
    array = array.map { |data| [data.titleize, data] }
    options_for_select(array, selected)
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
