module MonitorSystem
  # Servers class
  class Servers < Grape::API
    version 'v1'
    format :json
    prefix :api
    resource :servers do
      desc 'New server request from agent'
      post do
        user = User.find_by_server_key(params[:server_key])
        user
          .server_requests
          .create!(server_name: params[:name], status: :pending)
      end
    end
  end
end
