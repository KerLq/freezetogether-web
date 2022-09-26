# frozen_string_literal: true

module Backend
  class WelcomePolicy < ApplicationPolicy
    def index?
      Current.user&.admin?
    end

    def show?
      Current.user&.admin?
    end
  end
end
