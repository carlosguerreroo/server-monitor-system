# User model
# username:string
# password_digest:string
# server_key:string
class User < ActiveRecord::Base
  validates :username, :server_key, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 6 }

  has_secure_password

  has_many :session_tokens
  has_many :servers
  has_many :process_reports, through: :servers
  has_many :server_requests

  before_validation :generate_server_key, on: :create

  def generate_session_token
    session_tokens.create.token
  end

  private

  def generate_server_key
    self.server_key ||= SecureRandom.urlsafe_base64(8)
  end
end
