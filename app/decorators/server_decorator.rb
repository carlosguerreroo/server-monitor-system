# Server Decorator Class
class ServerDecorator < Draper::Decorator
  delegate_all

  def cpu_usage
    return not_info_collected unless last_process_report
    last_process_report.total_cpu_usage.to_s
  end

  def disk_usage
    return not_info_collected unless last_disk_report
    "#{last_disk_report.used} mb / #{last_disk_report.total} mb"
  end

  def process_running
    return not_info_collected unless last_process_report
    "#{last_process_report.activities.count} process running"
  end

  private

  def not_info_collected
    'not info collected yet'
  end
end
