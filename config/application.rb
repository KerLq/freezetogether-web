# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

ActiveStorage::Engine.config
.active_storage
.content_types_to_serve_as_binary
.delete('image/svg+xml')

module FreezetogetherWeb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    def secret_key_base
      'NWS4hdCq3vr6Dk4nVWqpz28UxTPm02QnFCxPAGKGuTYoGdSNrQhXZJ0pL5kddOG'
    end
  end
end
