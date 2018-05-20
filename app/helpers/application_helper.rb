# frozen_string_literal: true

# Responsible for common helpers methods for layout
module ApplicationHelper
  def render_shared(partial)
    render "layouts/shared/#{partial}"
  end

  def body_class(options = {})
    extra_body_classes_symbol = options[:extra_body_classes_symbol] || :extra_body_classes
    qualified_name = controller.controller_path.tr('/', '-')
    basic_body_class = "#{qualified_name} #{qualified_name}-#{controller.action_name}"

    if content_for?(extra_body_classes_symbol)
      [basic_body_class, content_for(extra_body_classes_symbol)].join(' ')
    else
      basic_body_class
    end
  end

  def provide_description(string)
    provide(:description, string)
  end

  def provide_keywords(string)
    provide(:keywords, string)
  end
end
