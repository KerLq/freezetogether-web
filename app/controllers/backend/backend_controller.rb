# frozen_string_literal: true

module Backend
  class BackendController < ApplicationController
    include self::Backend::PunditInit

    layout 'backend'
  end
end
