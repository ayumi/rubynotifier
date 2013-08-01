require 'redis'

url = Rails.env == "production" ? ENV["REDISCLOUD_URL"] : "redis://localhost:6379"
uri = URI.parse(url)
$redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)