require 'prawn/table'
# Activity Report Pdf
class ActivityReportPdf < Prawn::Document
  def initialize(activities)
    super()
    @activities = activities
    text 'Activities Report', size: 20, style: :bold
    reports
  end

  def reports
    move_down 10
    table rows
  end

  def rows
    [['Name', 'CPU Time', 'CPU Usage']] + @activities.map do |activity|
      [activity.name.to_s, activity.cpu_time.to_s, activity.cpu_usage.to_s]
    end
  end
end
