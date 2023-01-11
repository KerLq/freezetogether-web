# frozen_string_literal: true

module FrontendHelper
  def seconds_to_hms(sec)
    format('%02d:%02d:%02d', sec / 3600, sec / 60 % 60, sec % 60)
  end
end
