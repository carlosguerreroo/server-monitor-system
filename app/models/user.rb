# User model
# username:string
# password_digest:string
class User < ActiveRecord::Base
  validates :username, presence: true
  validates :username, uniqueness: true
  validates :username, length: { minimum: 6 }

  has_secure_password
end
