class TelegramWorker
  include Sidekiq::Worker
  require 'telegram/bot'

  def perform(job_id)
    set_domain(job_id)

    Telegram::Bot::Client.run(@token) do |bot|
      bot.api.send_message(chat_id: @group_id, text: "#{@job.title} \n
     Ссылка: http://juniorjobs.#{@tail}/job/#{@job.id}")
    end
   end

  def set_domain(job_id)
    @job = Job.find_by(id: job_id)
    @token = ENV["TELEGRAM_TOKEN_#{@job.country}"]
    @group_id = ENV["TELEGRAM_GROUP_ID_#{@job.country}"]
    @tail = @job.country.downcase
   end
end
