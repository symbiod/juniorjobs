# frozen_string_literal: true

module Integrations
  module Github
    # The Job runs contributors list reloading
    class UpdateContributorsJob < ApplicationJob
      queue_as :default

      def perform
        cache = Cache::GithubService.new
        service = Integrations::GithubService.new

        cache.update(:contributors, service.contributors)
      end
    end
  end
end
