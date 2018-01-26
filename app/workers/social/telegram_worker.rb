# frozen_string_literal: true

# Worker for send message to telegram channel (gem 'telegram-bot-ruby')
class TelegramWorker < BaseWorker
  include Sidekiq::Worker
  require 'telegram/bot'

  def perform(job_id)
    load_job(job_id)
    prepare_for('TELEGRAM')

    Telegram::Bot::Client.run(@token) do |bot|
      bot.api.send_message(chat_id: @group_id, text: @message)
    end
  end
end
