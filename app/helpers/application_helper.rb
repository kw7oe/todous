module ApplicationHelper

	def render_navigation_bar
		content_for :navigation_bar do 
			render "layouts/navigation_bar" 
		end
	end

	 def user 
  	@user || current_user
  end
end
