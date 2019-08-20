# frozen_string_literal: true

class SyncSubscribersJob < ApplicationJob
  # queue_as :default
  #
  # def perform
  #   result = UnsubscribedUsersInteractor.call
  #   message = result.fail? ? 'We have no unsubscribed users' : "Synchonized unsubscribed users #{result}"
  #   logger.info message
  # end
end
