# frozen_string_literal: true

# The Job runs contributors list reloading every week
class LoadContributorsJob < ApplicationJob
  queue_as :default

  def perform
    load_contributors
  end

  private

  def load_contributors
    ContributorsService.reload_list
  end
end
