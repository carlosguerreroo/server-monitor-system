module Manager
  # Disk Reports Controller class
  class DiskReportsController < BaseController
    def index
      @disk_reports = disks_reports
      respond_to do |format|
        format.html
        format.pdf do
          pdf = DiskReportPdf.new(disks_reports)
          send_data pdf.render, filename: "#{server.name}-disk-report",
                                type: 'application/pdf',
                                disposition: 'inline'
        end
      end
    end

    private

    def disks_reports
      server.disk_reports
    end

    def server
      current_user.servers.find_by_id(params[:server_id])
    end
  end
end
