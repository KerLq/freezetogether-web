# frozen_string_literal: true

class ApplicationController
  module Backend
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

        def authorize(record, query = nil)
          super(record, query, policy_class:)
        end

        def policy_scope(scope)
          super(scope, policy_scope_class:)
        end

        def permitted_attributes(model)
          super([:backend, model])
        end
      end
    end
  end
end
