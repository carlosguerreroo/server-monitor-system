module Manager
  # ServersController class
  class ServersController < BaseController
    def index
      @servers = current_user.servers.decorate
    end

    def requests
      @server_requests = server_requests.pending
    end

    def accept
      server_request = server_requests.find_by_id(params[:id])
      server_request.update(status: :accepted)
      current_user.servers.create!(name: server_request.server_name,
                                   last_connection: Time.now,
                                   token: server_request.token, status: :online)
      redirect_to manager_requests_path
    end

    private

    def server_requests
      current_user.server_requests
    end
  end
end
