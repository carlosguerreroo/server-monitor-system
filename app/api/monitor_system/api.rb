module MonitorSystem
  # API class
  class API < Grape::API
    helpers MonitorSystem::Helpers::BaseHelper

    mount MonitorSystem::Alerts
    mount MonitorSystem::DiskReports
    mount MonitorSystem::ProcessReports
    mount MonitorSystem::Servers
  end
end
