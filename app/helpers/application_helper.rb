module ApplicationHelper
	def development?
		@is_development ||=(ENV['RAILS_ENV']=='development')
	end	
end
