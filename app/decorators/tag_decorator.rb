# frozen_string_literal: true

# Decorate methods for  display tag link.
class TagDecorator < ApplicationDecorator
  delegate_all
  include Draper::LazyHelpers

  def tag_link
    link_to(object + ',', tag_path(object))
  end
end
