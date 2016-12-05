module MonitorSystem
  # Alerts class
  class Alerts < Grape::API
    version 'v1'
    format :json
    prefix :api
    resource :alerts do
      desc 'Should the agent show a cpu usage alert'
      get :cpu_usage do
        current_server.show_cpu_usage?
      end

      desc 'Should the agent show a max_process alert'
      get :disk_usage do
        current_server.show_process_usage?
      end
    end
  end
end
