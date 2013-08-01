require 'redis'

REDIS_URL = Rails.env == "production" ? ENV["REDISCLOUD_URL"] : "redis://localhost:6379"
uri = URI.parse(REDIS_URL)
$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)