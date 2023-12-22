class HomeController < ApplicationController
  def index
    SearchChannel.broadcast_to("search_channel", message: "Hello, search results!")
  end
end
