# Server Model Class
# name:string
# status:integer
# last_connection:datetime
# user_id:integer
class Server < ActiveRecord::Base
  belongs_to :user
  validates :name, :status, :last_connection, :user, presence: true

  enum status: [:online, :offline]
end
