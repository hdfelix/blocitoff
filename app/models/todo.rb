class Todo < ActiveRecord::Base
	include ActionView::Helpers::DateHelper

	validates :description, presence: true

	def expired?
		self.created_at <= 7.days.ago
	end

	def days_left
		if self.expired?
			'expired'
		else
			time_ago_in_words(self.created_at + 7.days)
		end
	end
end
