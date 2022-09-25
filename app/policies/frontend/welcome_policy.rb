# frozen_string_literal: true

module Frontend
  class WelcomePolicy < ApplicationPolicy
    def index?
      true
    end
  end
end
