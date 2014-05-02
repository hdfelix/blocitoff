class TodoPolicy <ApplicationPolicy
	def index?
		user.present?
	end

	def show?
		index?
	end

	def update?
		index?
	end
end


