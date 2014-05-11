class TodoPolicy < ApplicationPolicy

	def destroy?
		user.present? && (record.user == user && record.user_id == user.id)
	end
end
