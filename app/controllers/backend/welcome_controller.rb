# frozen_string_literal: true

module Backend
  class WelcomeController < Backend::BackendController
    def index
      authorize(User)
    end
  end
end
