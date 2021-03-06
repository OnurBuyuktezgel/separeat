class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def destroy?
    true
  end

  def add_order?
    true
  end

  private

  def user_is_owner_or_admin?
    user == record.user || user.admin
  end
end
