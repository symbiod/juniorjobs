# frozen_string_literal: true

module ApplicationHelper
  def body_class(options = {})
    extra_body_classes_symbol = options[:extra_body_classes_symbol] || :extra_body_classes
    qualified_controller_name = controller.controller_path.tr('/', '-')
    basic_body_class = "#{qualified_controller_name} #{qualified_controller_name}-#{controller.action_name}"

    if content_for?(extra_body_classes_symbol)
      [basic_body_class, content_for(extra_body_classes_symbol)].join(' ')
    else
      basic_body_class
    end
  end

  def current_country
    :ru
  end

  def flashes
    flash.to_hash.slice('alert', 'error', 'notice', 'success')
  end

  def render_shared(partial)
    render "layouts/shared/#{partial}"
  end
end
