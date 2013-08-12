module ApplicationHelper
  def current_ruby_version
    $redis.get("latest_ruby")
  end

  def current_ruby_version_url
    $redis.get("latest_ruby_url")
  end

  def ga_tracking_snippet
    if ENV['GA_TRACKING_ID'] && ENV['GA_DOMAIN'] && Rails.env == 'production'
      render partial: "shared/ga_tracking_snippet", locals: { ga_tracking_id: ENV['GA_TRACKING_ID'], ga_domain: ENV['GA_DOMAIN'] }
    end
  end
end
