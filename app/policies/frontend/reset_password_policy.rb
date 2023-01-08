# frozen_string_literal: true

module Frontend
  class ResetPasswordPolicy < ApplicationPolicy
    def new?
      true
    end

    def create_reset_password_link?
      true
    end
  end
end
