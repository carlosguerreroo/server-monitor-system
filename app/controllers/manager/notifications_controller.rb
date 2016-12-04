module Manager
  # NotificationsController class
  class NotificationsController < BaseController
    def index
      @notifications = notifications
    end

    private

    def notifications
      current_user.servers.find_by_id(params[:server_id]).notifications
    end
  end
end
