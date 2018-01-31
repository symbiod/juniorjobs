# frozen_string_literal: true

# parent class for workers each social web
module Socials
  # TODO: documentation is missing for this class
  # We should consider addig some documentation here
  class BasePostJob < ApplicationJob
    queue_as :default

    attr_reader :token, :group_id, :message

    def perform(_job_id)
      load_job(job_id)
    end

    protected

    def prepare_for(provider)
      load_token(provider)
      load_group_id(provider)
      generate_url
      generate_message
    end

    def load_job(job_id)
      @job = Job.find_by(id: job_id)
    end

    def load_token(provider)
      @token = ENV["#{provider}_TOKEN_#{job.country.upcase}"]
    end

    def load_group_id(provider)
      @group_id = ENV["#{provider}_GROUP_ID_#{job.country.upcase}"]
    end

    def generate_url
      @link = CountryUtility::DOMAINS[job.country.to_sym] + "/job#{job.id}"
    end

    def generate_message
      @message = "Требуется:
        #{job.title} (#{job.city}, от #{job.salary_from}) \n
        Компания: #{job.company_name}
        Откликнуться: #{link}"
    end
  end
end
