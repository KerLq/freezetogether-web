# frozen_string_literal: true

module Frontend
  class FrontendController < ApplicationController
    include self::Frontend::PunditInit

    layout 'frontend'

    def index; end
  end
end
