# frozen_string_literal: true

class NotificationWorker
  include Sidekiq::Worker

  def perform(stream_entry_id, target_account_id)
    SendInteractionService.new.call(StreamEntry.find(stream_entry_id), Account.find(target_account_id))
  end
end
