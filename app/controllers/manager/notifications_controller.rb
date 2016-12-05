module Manager
  # NotificationsController class
  class NotificationsController < BaseController
    def index
      @notifications = notifications
    end

    def update
      notifications
        .update(params[:notifications].keys, params[:notifications].values)
      redirect_to manager_server_notifications_path(params[:server_id])
    end

    private

    def notifications
      current_user.servers.find_by_id(params[:server_id]).notifications
    end
  end
end
