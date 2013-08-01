desc "Check ruby-lang.org RSS feed for the latest version of Ruby."
task :check_latest_ruby do
  require 'nokogiri'
  require 'open-uri'

  RUBY_RSS_URL = "http://www.ruby-lang.org/en/feeds/news.rss"
  TITLE_REGEX = /^Ruby (.*) is released$/

  doc = Nokogiri::XML(open(RUBY_RSS_URL))
  version = doc.xpath("//item").map do |item|
    title = item.xpath("title").text
    regex_match = TITLE_REGEX.match(title) and regex_match[1]
  end.compact.first

  puts "Latest version: #{version}"
end
