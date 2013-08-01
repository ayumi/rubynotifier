sidekiq_redis = { url: REDIS_URL, namespace: 'sidekiq' }

Sidekiq.configure_server { |config| config.redis = sidekiq_redis }
Sidekiq.configure_client { |config| config.redis = sidekiq_redis }