module Tasks::GraphHelper

	def self.data_for(format)
		hash = Task.done_from(day_for(format).days.ago).group(group_query_for(format)).count.sort
  	label = hash.map { |a| a[0].strftime(date_for(format)) }
  	data = hash.map {|a| a[1] }
  	return {
  		label: label,
  		data: data
  	}
	end

	private

	def self.day_for(format) 
		return 7 if format == "week" 
		return 30 # Month
	end

	def self.group_query_for(format) 		
		return "date(done_at)" if format == "week"
		return "date_trunc('week', done_at)" # Month
	end

	def self.date_for(format)
		return "%A-%d" if format == "week"
		return "%d/%m/%y"	# Month
	end

end
