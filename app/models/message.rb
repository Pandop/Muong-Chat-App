class Message < ApplicationRecord
  belongs_to :room, optional: true
  validates :room, presence:true
  validates :body, :username, presence: true
end
