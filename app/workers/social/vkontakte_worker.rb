# frozen_string_literal: true

# Worker for publish post to vk. (gem 'vkontakte_api')
class VkontakteWorker < BaseWorker
  include Sidekiq::Worker

  def perform(job_id)
    load_job(job_id)
    prepare_for('VKONTAKTE')

    @vk = VkontakteApi::Client.new(@token)
    @vk.wall.post(owner_id: @group_id, from_group: 1, message: @message,
                  attachments: @link)
  end
class VkontakteWorker <  BaseWorker
class VkontakteWorker < BaseWorker
  include Sidekiq::Worker

  def perform(job_id)
    load_job(job_id)
    prepare_for('VKONTAKTE')

    @vk = VkontakteApi::Client.new(@token)
    @vk.wall.post(owner_id: @group_id, from_group: 1, message: @message,
                  attachments: @link)
  end
end
