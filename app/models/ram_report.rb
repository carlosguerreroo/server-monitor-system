# Ram Report Model Class
# total:integer
# used:integer
# server_id:integer
class RamReport < ActiveRecord::Base
  belongs_to :server

  validates :total, :user, :server, presence: true
end
