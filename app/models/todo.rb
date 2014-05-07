class Todo < ActiveRecord::Base
	include ActionView::Helpers::DateHelper

	belongs_to :user

	validates :description, presence: true

	default_scope { order('created_at ASC') }
	scope :visible_to, ->(user) { user ? where(user_id: params[user_id]) : none }
	
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
