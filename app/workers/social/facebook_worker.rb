class FacebookWorker <  BaseWorker
  include Sidekiq::Worker

  def perform(job_id)
    set_domain(job_id, post_to='FB')
    @graph = Koala::Facebook::API.new(@token)
    @graph.put_wall_post(@message,
                         {
                         }, @group_id)
 end

 end
