module ApplicationHelper
  def current_ruby_version
    $redis.get("latest_ruby")
  end

  def current_ruby_version_url
    $redis.get("latest_ruby_url")
  end
end
