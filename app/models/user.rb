class User < ApplicationRecord
  # Ensure the username is unique
  validates :username, presence: true, uniqueness: true

  # Generates a new token
  def regenerate_auth_token
    self.auth_token = generate_authentication_token
    save!
  end

  private

  def generate_authentication_token
    loop do
      token = SecureRandom.hex
      break token unless User.exists?(auth_token: token)
    end
  end
end
