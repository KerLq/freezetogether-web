# frozen_string_literal: true

module BackendHelper
  def active_link_to(name = nil, options = nil, html_options = nil, &block)
    active_class = html_options[:active] || "active"
    html_options.delete(:active)
    html_options[:class] = "#{html_options[:class]} #{active_class}" if current_page?(options) || request.path =~ (/#{options}/) && !html_options[:disable_affinity]
    link_to(name, options, html_options, &block)
  end
end
