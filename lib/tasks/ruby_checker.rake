desc "Check ruby-lang.org RSS feed for the latest version of Ruby."
task :fetch_latest_ruby => :environment do
  require 'nokogiri'
  require 'open-uri'
  require './lib/init_redis.rb'

  RUBY_RSS_URL = "http://www.ruby-lang.org/en/feeds/news.rss"
  TITLE_REGEX = /^Ruby (.*) is released$/

  Rails.logger.info "Fetching latest Ruby version from ruby-lang.org ..."
  doc = Nokogiri::XML(open(RUBY_RSS_URL))
  version = doc.xpath("//item").map do |item|
    title = item.xpath("title").text
    regex_match = TITLE_REGEX.match(title) and regex_match[1]
  end.compact.first
  Rails.logger.info "Latest Ruby is #{version}."

  $redis.set("latest_ruby", version)
  Rails.logger.info "Saved Ruby version string to Redis."
end
