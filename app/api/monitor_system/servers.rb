module MonitorSystem
  # Servers class
  class Servers < Grape::API
    version 'v1'
    format :json
    prefix :api
    get :users do
    end
  end
end
