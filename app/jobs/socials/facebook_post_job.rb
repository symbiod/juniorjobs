# frozen_string_literal: true

# Job for publish post to facebook. (gem koala)
module Socials
  # TODO: documentation is missing for this class
  # We should consider addig some documentation here
  class FacebookPostJob < BasePostJob
    def perform(job_id)
      super
      prepare_for('FACEBOOK')
      client.put_wall_post(message, {}, group_id)
    end

    def client
      Koala::Facebook::API.new(token)
    end
  end
end
