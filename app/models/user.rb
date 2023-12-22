class User < ApplicationRecord
  validates :name, presence: true

  def generate_token
    payload = { user_id: self.id }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
