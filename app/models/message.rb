class Message < ApplicationRecord
  belongs_to :user

  validates :content, presence: true, length: { maximum: 10000 }
end
