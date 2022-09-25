# frozen_string_literal: true

module Frontend
  class SessionPolicy < ApplicationPolicy
    def create?
      user.nil?
    end

    def destroy?
      user.present?
    end
  end
end
