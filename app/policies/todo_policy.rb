class TodoPolicy < ApplicationPolicy

	def index?
		user.present?
	end

	def show?
		user.present? && (record.user == user && record.user_id == user.id)
	end
	
	def create?
		show?
	end

	def destroy?
		show?
	end
end
