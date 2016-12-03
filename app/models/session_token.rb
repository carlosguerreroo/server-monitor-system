# SessionToken model
# token:string
# user_id:integer
# expires_at:datetime
class SessionToken < ActiveRecord::Base
  belongs_to :user
  validates :token, uniqueness: true
  validates :user, :token, :expires_at, presence: true

  before_validation :generate_access_token, on: :create
  before_validation :set_expiration_date

  def self.expire_token!(token)
    session_token = find_by_token(token)
    return unless session_token
    session_token.update(expires_at: 1.month.ago)
  end

  def self.user(token)
    session_token = where('expires_at > ?', Time.now).where(token: token).sample
    return unless session_token
    session_token.user
  end

  private

  def generate_access_token
    loop do
      self.token = SecureRandom.hex + SecureRandom.hex
      break unless self.class.exists?(token: token)
    end
  end

  def set_expiration_date
    self.expires_at ||= DateTime.current + 30.days
  end
end
