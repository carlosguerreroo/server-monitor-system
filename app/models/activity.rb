# Activity (Process) Model class
# name:string
# process_report_id:integer
# cpu_time:integer
# cpu_usage:float
class Activity < ActiveRecord::Base
  belongs_to :process_report

  validates :name, :cpu_time, :cpu_usage, :process_report, presence: true
end
