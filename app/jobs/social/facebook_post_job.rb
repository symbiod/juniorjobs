# frozen_string_literal: true

# Job for publish post to facebook. (gem koala)
class FacebookPostJob < BasePostJob
  def perform(job_id)
    load_job(job_id)
    prepare_for('FACEBOOK')
    @graph = Koala::Facebook::API.new(@token)
    @graph.put_wall_post(@message,
                         {
                         }, @group_id)
  end
end
