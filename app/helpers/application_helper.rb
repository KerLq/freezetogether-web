# frozen_string_literal: true

module ApplicationHelper
  def show_svg(blob)
    blob.open do |file|
      raw file.read # rubocop:disable Rails/OutputSafety
    end
  end

  def flash_classes(type)
    case type
    when 'error'
      'flash--red'
    when 'success'
      'flash--green'
    end
  end
end
