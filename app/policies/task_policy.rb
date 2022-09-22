# frozen_string_literal: true

class TaskPolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    index?
  end

  def create?
    true
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
