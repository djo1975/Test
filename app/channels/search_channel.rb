class SearchChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'search_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
  def receive(data)
    ActionCable.server.broadcast("search_channel", { query: data["query"] })
  end

end
