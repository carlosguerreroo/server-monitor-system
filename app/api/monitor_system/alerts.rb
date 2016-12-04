module MonitorSystem
  # Alerts class
  class Alerts < Grape::API
    version 'v1'
    format :json
    prefix :api
    resource :alerts do
    end
  end
end
