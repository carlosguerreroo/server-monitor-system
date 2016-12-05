module MonitorSystem
  # DiskReports class
  class DiskReports < Grape::API
    version 'v1'
    format :json
    prefix :api

    resource :disk_reports do
      desc 'Create a new disk report'
      post do
        current_server
          .disk_reports.create!(total: params[:total], used: params[:used])
      end
    end
  end
end
