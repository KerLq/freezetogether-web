# frozen_string_literal: true

module ApplicationHelper
  def show_svg(blob)
    blob.open do |file|
      raw file.read
    end
  end
end
