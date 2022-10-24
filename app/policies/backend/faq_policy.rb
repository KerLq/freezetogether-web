# frozen_string_literal: true

module Backend
  class FaqPolicy < ApplicationPolicy
    def index?
      Current.user&.admin?
    end

    def create?
      Current.user&.admin? && record
    end

    def show?
      Current.user&.admin?
    end

    def update?
      Current.user&.admin? && record
    end

    def destroy?
      Current.user&.admin? && record
    end

    def permitted_attributes
      %i[question answer category]
    end
  end
end
