module MonitorSystem
  module Helpers
    # BaseHelper module
    module BaseHelper
      def authenticate_system!; end

      def current_user
        User.find_by_server_key(params[:server_key])
      end

      def current_server
        current_user.servers.find_by_token!(params[:server_token])
      end
    end
  end
end
