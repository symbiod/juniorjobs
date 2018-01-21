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
