namespace :seed do
  desc 'Sample data to run the application'
  task sample: :environment do
    user = User.create(username: 'carlos', password: 'demo1234')

    server_linux = user.servers.create(name: 'Linux',
                                       status: :online,
                                       last_connection: Time.now)

    server_linux.disk_reports.create(total: 2040, used: 1000)
    server_linux.disk_reports.create(total: 2040, used: 110)
    server_linux.disk_reports.create(total: 2040, used: 11200)
    server_linux.disk_reports.create(total: 2040, used: 1000)


    linux_process_report = server_linux.process_reports.create

    linux_process_report.activities.create(name: 'Office',
      cpu_time: 12, cpu_usage: 0.6)
    linux_process_report.activities.create(name: 'Chrome',
      cpu_time: 120, cpu_usage: 0.6)

    server_mac = user.servers.create(name: 'Mac',
                                       status: :online,
                                       last_connection: 2.days.ago)

    server_mac.disk_reports.create(total: 3040, used: 2010)
    server_mac.disk_reports.create(total: 1040, used: 110)
    server_mac.disk_reports.create(total: 2040, used: 100)
    server_mac.disk_reports.create(total: 2040, used: 100)
  end
end
