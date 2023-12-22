# app/jobs/search_broadcast_job.rb
class SearchBroadcastJob < ApplicationJob
  queue_as :default

  def perform(params)
    ActionCable.server.broadcast('search_channel', params)
  end
end
