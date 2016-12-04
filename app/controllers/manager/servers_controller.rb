module Manager
  # ServersController class
  class ServersController < BaseController
    def index
      @servers = current_user.servers
    end
  end
end
