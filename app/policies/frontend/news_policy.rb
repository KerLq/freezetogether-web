# frozen_string_literal: true

module Frontend
  class NewsPolicy < ApplicationPolicy
    def index?
      true
    end

    def show?
      true
    end
  end
end
