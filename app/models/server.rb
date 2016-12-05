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
  after_create :set_notifications

  def last_disk_report
    disk_reports.last
  end

  def last_process_report
    process_reports.last
  end

  def show_cpu_usage?
    notification = notifications.max_cpu.first
    return false if notification.deactivated?
    return true if process_reports.last.total_cpu_usage > 80
    false
  end

  def show_process_usage?
    notification = notifications.max_process.first
    return false if notification.deactivated?
    return true if process_reports.last.total_cpu_usage > 80
    false
  end

  private

  def set_notifications
    notifications
      .create!(name: 'MAX CPU', notification_type: :max_cpu, status: :activated)
    notifications
      .create!(name: 'MAX PROCESS',
               notification_type: :max_process, status: :activated)
  end
end
