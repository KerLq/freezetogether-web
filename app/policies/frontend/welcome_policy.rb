# frozen_string_literal: true

module Frontend
  class WelcomePolicy < ApplicationPolicy
    def index?
      true
    end

    def gameinfo?
      true
    end

    def help?
      true
    end

    def leaderboard?
      true
    end
  end
end
