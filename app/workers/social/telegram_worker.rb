  class TelegramWorker <  BaseWorker
  include Sidekiq::Worker
  require 'telegram/bot'

  def perform(job_id)
    set_domain(job_id,post_to='TELEGRAM')

    Telegram::Bot::Client.run(@token) do |bot|
      bot.api.send_message(chat_id: @group_id, text: "#{@job.title} \n
     Ссылка: http://juniorjobs.#{@tail}/job/#{@job.id}")
    end
   end


end
