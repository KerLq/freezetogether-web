# frozen_string_literal: true

module Frontend
  class AchievementPolicy < ApplicationPolicy
    def index?
      true
    end

    def show?
      true
    end
  end
end
