module Manager
  # Activities  Controller class
  class ActivitiesController < BaseController
    def index
      @activities = process_report.activities
      respond_to do |format|
        format.html
        format.pdf do
          pdf = ActivityReportPdf.new(process_report.activities)
          send_data pdf.render, filename: "#{process_report.id}-activities-report",
                                type: 'application/pdf',
                                disposition: 'inline'
        end
      end
    end

    private

    def process_report
      current_user.process_reports.find_by_id(params[:process_report_id])
    end
  end
end
