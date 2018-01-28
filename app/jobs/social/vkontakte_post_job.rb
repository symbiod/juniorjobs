# frozen_string_literal: true

# Job for publish post to vk. (gem 'vkontakte_api')
class VkontaktePostJob < BasePostJob
  def perform(job_id)
    super
    prepare_for('VKONTAKTE')
    client.wall.post(owner_id: group_id, from_group: 1, message: message, attachments: link)
  end

  def client
    VkontakteApi::Client.new(token)
  end
end
