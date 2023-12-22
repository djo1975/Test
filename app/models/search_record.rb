# app/models/search_record.rb
class SearchRecord < ApplicationRecord
    belongs_to :user
  
    validates :query, presence: true
end
  