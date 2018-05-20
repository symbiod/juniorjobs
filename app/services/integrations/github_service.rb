# frozen_string_literal: true

require 'octokit'

module Integrations
  # Responsobel for github integration  
  class GithubService 
    def initialize
      @client = Octokit::Client.new(per_page: 1000)
    end

    def contributors
      @contributors ||= @client.contributors('howtohireme/juniorjobs')
    end
  end
end
