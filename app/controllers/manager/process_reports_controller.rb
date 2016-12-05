module Manager
  # Process Reports Controller class
  class ProcessReportsController < BaseController
    def index
      @process_reports = server.process_reports
    end

    private

    def server
      current_user.servers.find_by_id(params[:server_id])
    end
  end
end
