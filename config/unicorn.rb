# per
# https://devcenter.heroku.com/articles/rails-unicorn#config
# https://devcenter.heroku.com/articles/concurrency-and-database-connections#multi-process-servers

worker_processes Integer(ENV["UNICORN_WORKERS"] || 3)
timeout 15
preload_app true

before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  if defined?(ActiveRecord::Base) 
    ActiveRecord::Base.connection.disconnect!
  end
end 

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  if defined?(ActiveRecord::Base)
    config = Rails.application.config.database_configuration[Rails.env]
    config['reaping_frequency'] = ENV['DB_REAP_FREQ'] || 10 # seconds
    config['pool']            = ENV['DB_POOL'] || 6
    ActiveRecord::Base.establish_connection(config)
  end
end
