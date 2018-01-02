<<<<<<< HEAD
require 'dotenv'

Sidekiq.configure_server do |config|
  config.redis = { url: ENV['REDIS_URL'] }
end

Sidekiq.configure_client do |config|
  config.redis = { url: ENV['REDIS_URL'] }
=======
Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://127.0.0.1:6379' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://127.0.0.1:6379' }
>>>>>>> d56574a22cd4375e2684d8b4f6179084f584857a
end