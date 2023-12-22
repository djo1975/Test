# app/models/user.rb
class User < ApplicationRecord
    has_many :search_records
    validates :remember_token, presence: true, uniqueness: true
end
  