module Tasks::GraphHelper

  # Public API
  def self.data_for(option, period)
    start_date, end_date = get_date_range_for(option, period)
    label = get_label_for(option, (start_date..end_date))
    data =  get_data_for(option, start_date, label)
    return {
      label: label,
      data: data
    }
  end

  private
  def self.get_label_for(option, range)
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

  def self.get_data_for(option, start_date, label)
    array = Task.done_for(start_date).group(group_query_for(option)).count.sort   
    return label.each_with_index.map do |l, index| 
      if index < array.length
        array[index][1] 
      else 
        0
      end
    end
  end

  # Helper Methods
  def self.group_query_for(option)    
    return "date_trunc('month', done_at)" if option == "year" 
    return "date(done_at)" # Week
  end

  def self.date_format_for(option)
    return "%A" if option == "week"
    return "%d/%m/%y" if option == "month"
    return "%B" # Year
  end

  def self.get_date_range_for(option, period)
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
