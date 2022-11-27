# frozen_string_literal: true

module Backend
  class UserPolicy < ApplicationPolicy
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

    def upload_image?
      Current.user&.admin? && record
    end

    def permitted_attributes
      %i[username email password description avatar]
    end
  end
end
