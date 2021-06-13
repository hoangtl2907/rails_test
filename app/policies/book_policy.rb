class BookPolicy < ApplicationPolicy
  def index?
    user.is_user?
  end

  def show?
    user.is_user?
  end

  def create?
    user.is_user?
  end

  def update?
    user.is_user?
  end

  def destroy?
    user.is_user?
  end
end
