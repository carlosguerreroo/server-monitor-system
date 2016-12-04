# ServerRequest class
# server_name:string
# token:string
# status:integer
# user_id:integer
class ServerRequest < ActiveRecord::Base
  belongs_to :user

  validates :server_name, :token, :status, :user, presence: true

  before_validation :generate_token, on: :create

  enum :status [:pending, :rejected, :accepted]

  private

  def generate_token
    self.token ||= SecureRandom.urlsafe_base64(8)
  end
end
