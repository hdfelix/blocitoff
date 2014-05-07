class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
		user.present?
  end

  def show?
		index?
  end

  def create?
		user.present?
  end

  def new?
    create?
  end

  def update?
		user.present? && (record.user == user)
  end

  def edit?
    update?
  end

  def destroy?
		update?
  end

  def scope
    #Pundit.policy_scope!(user, record.class)
		record.class
  end
end

