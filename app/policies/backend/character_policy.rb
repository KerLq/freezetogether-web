# frozen_string_literal: true

module Backend
  class CharacterPolicy < ApplicationPolicy
    def index?
      Current.user&.admin?
    end

    def show?
      Current.user&.admin? && record
    end

    def create?
      Current.user&.admin?
    end

    def update?
      Current.user&.admin? && record
    end

    def destroy?
      Current.user&.admin? && record
    end

    def permitted_attributes
      %i[title name description quote image]
    end
  end
end
