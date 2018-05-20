# frozen_string_literal: true

module Integrations
  module Github
    # Responsible for getting contributors list
    class ContributorsInteractor < BaseInteractor
      delegate :cache, :service, to: :context

      before do
        context.cache = Cache::GithubService.new
        context.service = Integrations::GithubService.new
      end

      def call
        collection = cache.fetch(:contributors, service.contributors)
        context.result = collection.map { |github| github[:login] }
      end
    end
  end
end
