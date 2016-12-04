# Activity (Process) Model class
# name:string
# process_report_id:integer
class Activity < ActiveRecord::Base
  belongs_to :process_report

  validates :name, :process_report, presence: true
end
