# frozen_string_literal: true

module Frontend
  class UserPolicy < ApplicationPolicy
    def create?
      user.nil?
    end

    def show?
      true
    end

    def confirm_email?
      true
    end

    def update?
      user == record
    end

    def upload_image?
      user == record
    end

    def reset_password?
      record.present?
    end

    def permitted_attributes
      %i[email password description]
    end

    def permitted_attributes_for_create
      %i[username email password tos]
    end

    def permitted_attributes_for_reset_password
      %i[password]
    end

    def permitted_attributes_for_update
      %i[email password description]
    end
  end
end
