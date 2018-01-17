class VkontakteWorker <  BaseWorker
  include Sidekiq::Worker

  def perform(job_id)
    set_domain(job_id, post_to='VK')

    @vk = VkontakteApi::Client.new(@token)
    @vk.wall.post(owner_id: @group_id, from_group: 1, message: @message,
                  attachments: @link )
 end

end
