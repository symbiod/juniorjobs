# frozen_string_literal: true

module Web
  # TODO: documentation is missing for this class
  # We should consider addig some documentation here
  class TagsController < ApplicationController
    def index
      @tags = ActsAsTaggableOn::Tag.all
      render json: @tags
    end
  end
end

