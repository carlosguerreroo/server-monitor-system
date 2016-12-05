# Notification model class
# name:string
# notification_type:integer
# status:integer
# server_id:integer
class Notification < ActiveRecord::Base
  belongs_to :server

  validates :name, :notification_type, :status, :server, presence: true

  enum status: [:activated, :deactivated]
  enum notification_type: [:max_cpu, :max_process]
end
