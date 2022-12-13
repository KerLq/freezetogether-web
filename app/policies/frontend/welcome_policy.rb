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

    def download?
      true
    end

    def leaderboard?
      true
    end

    def imprint?
      true
    end

    def privacy?
      true
    end

    def legacy?
      true
    end

    def updates?
      true
    end

    def user_agreement?
      true
    end
  end
end
