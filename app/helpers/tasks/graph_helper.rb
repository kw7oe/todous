module Tasks::GraphHelper

	def self.data_for(option)
		start_date, end_date = get_date_range_for(option)
	  array = Task.done_for(start_date).group("date(done_at)").count.sort
  	puts array
  	# Refactor needed
  	label = (start_date..end_date).map { |date| date.strftime(date_for(option)) }
  	data =  (start_date..end_date).each_with_index.map do |date, index| 
  		if index < array.length
  			puts "Index: #{index} Date: #{date}"
  			puts "Volumn: #{array[index][1]}"
  			array[index][1] 
  		else 
  			0
  		end
  	end
  	puts data
  	return {
  		label: label,
  		data: data
  	}
	end

	private
	def self.group_query_for(option) 		
		return "date(done_at)" if option == "week"
		return "date_trunc('week', done_at)" # Month
	end

	def self.date_for(option)
		return "%A-%d" if option == "week"
		return "%d/%m/%y"	# Month
	end

	def self.get_date_range_for(option)
    date = Date.today
    start_date, end_date = Date.new
    case option         
      when "month"
      	# Can be refactor 
        start_date = date.beginning_of_month
        end_date = start_date.end_of_month
      else 
        start_date = date.beginning_of_week # Week
        end_date = date.end_of_week
    end
    return [start_date, end_date]
  end

end
