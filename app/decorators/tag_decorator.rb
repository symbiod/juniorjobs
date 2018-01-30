# frozen_string_literal: true

# Decorate methods for  display tag link. 
class TagDecorator < ApplicationDecorator

  def tag_link
    link_to(object + ',', tag_path(object))
  end
end
