# frozen_string_literal: true

module Web
  # TODO: documentation is missing for this class
  # We should consider addig some documentation here
  class TagsController < ApplicationController
    def index
      @tags = ActsAsTaggableOn::Tag.all
      render json: @tags
    end

    def show
      @tag = params[:id]
      @jobs_with_tag = Job.tagged_with(params[:id])
      render  "web/welcome/jobs_with_tag"
    end
  end
end
