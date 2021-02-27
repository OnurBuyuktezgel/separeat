class TablePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def qr_code?
    true
  end

  def create?
    true if @user.user_type == "Restaurant Owner"
  end

  def show?
    true
  end

  def destroy?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    user == record.user || user.admin
  end
end
