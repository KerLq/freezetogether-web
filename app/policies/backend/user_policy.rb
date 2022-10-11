# frozen_string_literal: true

module Backend
  class UserPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        return scope.none unless user

        scope.where(user)
      end
    end

    def index?
      Current.user&.admin?
    end

    def create?
      Current.user&.admin?
    end

    def show?
      Current.user&.admin?
    end

    def update?
      Current.user&.admin?
    end

    def upload_image?
      Current.user&.admin?
    end

    def permitted_attributes
      %i[username email password description]
    end
  end
end
