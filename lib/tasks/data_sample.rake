namespace :seed do
  desc 'Sample data to run the application'
  task sample: :environment do
    user = User.create(username: 'carlos', password: 'demo1234')

    server_linux = user.servers.create(name: 'Linux',
                                       status: :online,
                                       last_connection: Time.now)

  end
end
