# frozen_string_literal: true

module Frontend
  class WelcomePolicy < ApplicationPolicy
    def index?
      true
    end

    def spielinfo?
      true
    end

    def hilfe?
      true
    end

    def bestenliste?
      true
    end
  end
end
