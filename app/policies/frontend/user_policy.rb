# frozen_string_literal: true

module Frontend
  class UserPolicy < ApplicationPolicy
    def create?
      true
    end

    def show?
      true
      # user.private?
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

    def permitted_attributes
      %i[username email password description]
    end

    def permitted_attributes_for_create
      %i[username email password]
    end
  end
end
