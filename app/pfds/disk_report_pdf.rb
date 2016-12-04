require 'prawn/table'
# Disk Report Pdf
class DiskReportPdf < Prawn::Document
  def initialize(disk_reports)
    super()
    @disk_reports = disk_reports
    text 'Disk Report', size: 20, style: :bold
    reports
  end

  def reports
    move_down 10
    table rows
  end

  def rows
    [['Used (mb)', 'Total (mb)', 'Created at']] + @disk_reports.map do |report|
      [report.used.to_s, report.total.to_s, report.created_at.to_s]
    end
  end
end
