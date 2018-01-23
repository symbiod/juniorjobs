# frozen_string_literal: true

module Web
  # TODO: documentation is missing for this class
  # We should consider addig some documentation here
  class WelcomeController < BaseController
    def index
      if params[:tag]
        @tag = params[:tag]
        @jobs_with_tag = Job.tagged_with(params[:tag])
        
        render :jobs_with_tag
      end     
                  
      @jobs_published_today = Job.published_today
      @jobs_published_yesterday = Job.published_yesterday
      @jobs_published_last_week = Job.published_last_week
      @jobs_published_last_month = Job.published_last_month
    end

    def method_name
      
    end
  end
end
