desc "Check ruby-lang.org RSS feed for the latest version of Ruby."
task :fetch_latest_ruby => :environment do
  require 'nokogiri'
  require 'open-uri'

  RUBY_RSS_URL = "http://www.ruby-lang.org/en/feeds/news.rss"
  TITLE_REGEX = /^Ruby (.*) is released$/

  Rails.logger.info "Fetching latest Ruby version from ruby-lang.org ..."
  doc = Nokogiri::XML(open(RUBY_RSS_URL))
  latest_version_item = doc.xpath("//item").select do |item|
    title = item.xpath("title").text and TITLE_REGEX =~ title
  end.first
  version = TITLE_REGEX.match(latest_version_item.xpath("title").text)[1]
  version_url = latest_version_item.xpath("link").text
  Rails.logger.info "Latest Ruby is #{version}."

  $redis.set("latest_ruby", version)
  $redis.set("latest_ruby_url", version_url)
  Rails.logger.info "Saved Ruby version and URL to Redis."
end
