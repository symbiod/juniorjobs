class VkWorker
  include Sidekiq::Worker

  def perform(job_id)
    job = Job.find_by(id: job_id)
    token = ENV["VK_TOKEN_#{job.country}"]
    group_id = ENV["VK_GROUP_ID_#{job.country}"]
    @vk = VkontakteApi::Client.new(token)
    @vk.wall.post(owner_id: group_id, from_group: 1, message: "#{job.title} \n
      Ссылка: http://juniorjobs.ru/job/#{job.id}",
                  attachments: "http://juniorjobs.ru/job/#{job.id}")
 end
end
