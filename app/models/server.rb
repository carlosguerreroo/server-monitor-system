# Server Model Class
# name:string
# status:integer
# last_connection:datetime
# user_id:integer
# token:string
class Server < ActiveRecord::Base
  belongs_to :user

  has_many :disk_reports
  has_many :process_reports
  has_many :notifications

  validates :name, :status, :last_connection, :user, :token, presence: true

  enum status: [:online, :offline]

  def last_disk_report
    disk_reports.last
  end

  def last_process_report
    process_reports.last
  end
end
