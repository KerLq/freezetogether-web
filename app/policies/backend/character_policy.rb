# frozen_string_literal: true

module Backend
  class CharacterPolicy < ApplicationPolicy
    def index?
      user&.admin?
    end

    def show?
      user&.admin?
    end

    def edit?
      user&.admin?
    end

    def create?
      user&.admin?
    end

    def update?
      user&.admin?
    end

    def permitted_attributes
      %i[title name description]
    end

    def permitted_attributes_for_create
      %i[title name description]
    end
  end
end
