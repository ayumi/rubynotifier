desc 'Ping self to prevent Heroku idling'
task :dyno_keep_alive do
  require 'net/http'
  uri = URI("http://#{ ENV['HEROKU_APP'] }.herokuapp.com")
  Net::HTTP.get_response(uri)
end