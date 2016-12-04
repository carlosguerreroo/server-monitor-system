module MonitorSystem
  # API class
  class API < Grape::API
    mount MonitorSystem::Servers
  end
end
