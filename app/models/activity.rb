# Activity (Process) Model class
class Activity < ActiveRecord::Base
  belongs_to :process_report
end
