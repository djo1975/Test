# app/controllers/search_controller.rb
class SearchController < ApplicationController
  before_action :authenticate_user

  def create
    query = params[:query]
    current_user.search_records.create(query: query)

    # Emitovanje pretrage putem ActionCable
    SearchBroadcastJob.perform_later(query: query, user_id: current_user.id)

    render json: { success: true, message: 'Search recorded successfully' }
  end

  private

  def authenticate_user
    unless current_user
      render json: { success: false, message: 'Authentication failed' }, status: :unauthorized
    end
  end
end
