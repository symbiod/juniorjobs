# frozen_string_literal: true

require 'octokit'

# The service load contributors list from github
class ContributorsBuilder
  def initialize
    @client = Octokit::Client.new(per_page: 1000)
  end

  def contributors_logins
    logins = []
    contributors.each do |contributor|
      logins << contributor.login
    end
    logins
  end

  # return [objects - contributors]
  def contributors
    @contributors ||= @client.contributors('howtohireme/juniorjobs')
  end
end
