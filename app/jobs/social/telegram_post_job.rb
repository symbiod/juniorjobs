# frozen_string_literal: true

# Job for send message to telegram channel (gem 'telegram-bot-ruby')
class TelegramPostJob < BasePostJob
  require 'telegram/bot'

  def perform(job_id)
    super

    prepare_for('TELEGRAM')

    Telegram::Bot::Client.run(token) do |bot|
      bot.api.send_message(chat_id: group_id, text: message)
    end
  end
end
