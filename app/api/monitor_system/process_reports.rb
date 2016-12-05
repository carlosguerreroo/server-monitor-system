module MonitorSystem
  # ProcessReports class
  class ProcessReports < Grape::API
    version 'v1'
    format :json
    prefix :api

    resource :process_reports do
      desc 'Create a new process report'
      post do
      end
    end
  end
end
