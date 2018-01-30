# frozen_string_literal: true

module Web
  # TODO: documentation is missing for this class
  # We should consider addig some documentation here
  class WelcomeController < BaseController
    def index
      @jobs_published_today = Job.published_today
      @jobs_published_yesterday = Job.published_yesterday
      @jobs_published_last_week = Job.published_last_week
      @jobs_published_last_month = Job.published_last_month
    end

    # def tags
    #   if tags_params
    #     @tag = tags_params
    #     @jobs_with_tag = Job.tagged_with(tags_params)
    #     render :jobs_with_tags
    #   end
    # end
    #
    # def tags_params
    #   params[:tags]
    # end
  end
end
