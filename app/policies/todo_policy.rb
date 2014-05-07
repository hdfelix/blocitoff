class TodoPolicy < ApplicationPolicy

	def destroy?
		puts "****** user.id: #{user.id}\nrecord.user_id: #{record.user_id} *****"
		user.present? && (record.user == user && record.user_id == user.id)
	end
end
