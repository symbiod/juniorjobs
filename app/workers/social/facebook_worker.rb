# frozen_string_literal: true

# Worker for publish post to facebook. (gem koala)
class FacebookWorker < BaseWorker
  include Sidekiq::Worker

  def perform(job_id)
    load_job(job_id)
    prepare_for('FACEBOOK')

class FacebookWorker <  BaseWorker
  include Sidekiq::Worker

  def perform(job_id)
    set_domain(job_id, post_to='FB')
class FacebookWorker < BaseWorker
  include Sidekiq::Worker

  def perform(job_id)
    load_job(job_id)
    prepare_for('FACEBOOK')

    @graph = Koala::Facebook::API.new(@token)
    @graph.put_wall_post(@message,
                         {
                         }, @group_id)
  end
end

 end
 end
>>>>>>> add twitter
