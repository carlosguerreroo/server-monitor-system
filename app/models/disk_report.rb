# Disk Report Model Class
# total:integer
# used:integer
# server_id:integer
class DiskReport < ActiveRecord::Base
  belongs_to :server

  validates :total, :used, :server, presence: true
end
