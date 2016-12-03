# User model
# username:string
# password_digest:string
class User < ActiveRecord::Base
  validates :username, presence: true
  validates :username, uniqueness: true
end
