# frozen_string_literal: true

class ApplicationController
  module PunditInit
    extend ActiveSupport::Concern

    included do
      include Pundit::Authorization

      after_action :verify_authorized

      def current_user
        Current.user
      end

      def policy_class
        @policy_class ||= "#{self.class.name[0..-11].singularize}Policy".constantize
      end

      def policy_scope_class
        @policy_scope_class ||= "#{self.class.name[0..-11].singularize}Policy::Scope".constantize
      end

      def controller_authorize(record, query = nil)
        authorize(record, query, policy_class:)
      end

      def controller_policy_scope(scope)
        policy_scope(scope, policy_scope_class:)
      end

      def controller_controller_permitted_attributes(model)
        scope = policy_class.name&.split('::')&.first&.to_sym

        super([scope, model])
      end
    end
  end
end
