class Todo < ActiveRecord::Base
	validates :description, presence: true

	def expired_todo?
		self.created_at <= 7.days.ago
		#(7.days - (Time.now - self.created_at)/86400) <= 0
	end
end
