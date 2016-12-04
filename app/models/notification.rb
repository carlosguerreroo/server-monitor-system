# Notification model class
# name:string
# type:integer
# status:integer
# server_id:integer
class Notification < ActiveRecord::Base
  belongs_to :server

  validates :name, :type, :status, :server, presence: true

  enum status: [:actived, :deactivated]
  enum type: [:max_cpu, :max_process]
end
