# Server Model Class
# name:string
# status:integer
# last_connection:datetime
# user_id:integer
class Server < ActiveRecord::Base
  belongs_to :user

  has_many :disk_reports
  has_many :process_reports

  validates :name, :status, :last_connection, :user, presence: true

  enum status: [:online, :offline]


  def last_disk_report
    ram_reports.last
  end

  def last_process_report
    process_reports.last
  end
end
