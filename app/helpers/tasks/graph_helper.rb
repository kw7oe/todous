module Tasks::GraphHelper

  COLORS = [
    "#EF5350",
    "#AB47BC",
    "#5C6BC0",
    "#42A5F5",
    "#26C6DA",
    "#26A69A",
    "#66BB6A",
    "#D4E157",
    "#FFEE58",
    "#FFA726",
    "#FF7043",
    "#FFAB91"
  ]
  
  # Public API
  def data_for(option, period)
    start_date, end_date = get_date_range_for(option, period)
    label = get_label_for(option, (start_date..end_date))
    data =  get_data_for(option, start_date, label)
    return {
      label: label,
      data: data
    }
  end

  def color_for(chart_type, color_length)
    if (chart_type == "pie" || chart_type == "doughnut") && color_length == 12 
      return COLORS
    end
    return COLORS[5]
  end

  private
  def get_label_for(option, range)
    if option == "year"
      return [
        "January", 
        "February", 
        "March", 
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
      ]
    end
    return range.map { |date| date.strftime(date_format_for(option)) }
  end

  def get_data_for(option, start_date, label)
    array = current_user.done_for(start_date).group(group_query_for(option)).count.sort   
    return label.each_with_index.map do |l, index| 
      if index < array.length
        array[index][1] 
      else 
        0
      end
    end
  end

  # Helper Methods
  def group_query_for(option)    
    return "date_trunc('month', done_at)" if option == "year" 
    return "date(done_at)" # Week
  end

  def date_format_for(option)
    return "%A" if option == "week"
    return "%d/%m/%y" if option == "month"
    return "%B" # Year
  end

  def get_date_range_for(option, period)
    date = Date.today
    if period == "previous" 
      date -= 7 if option == "week"
      date -= 31 if option == "month"
      date -= 366 if option == "year"
    end
    return date.get_start_and_end_date(option)    
  end
end

# Monkey Patching for Date Class
class Date 
  def get_start_and_end_date(option)
    start_date = self.public_send("beginning_of_#{option}")
    end_date = self.public_send("end_of_#{option}")
    return [start_date, end_date]
  end

end
