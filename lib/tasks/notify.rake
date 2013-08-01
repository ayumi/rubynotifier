desc "Enqueue notification emails."
task :notify_emails => :environment do
  Rails.logger.info "Enqueuing notification emails."

  version = $redis.get("latest_ruby")
  version_url = $redis.get("latest_ruby_url")
  if version.blank?
    Rails.logger.warn "No latest ruby version found in Redis, exiting."
  end

  # Update new subscriptions to the latest version
  Subscription.subscribed.where(last_version_string: '').update_all(last_version_string: version)

  # Notify people who need to be notified
  Subscription.subscribed.where.not(last_version_string: version).find_each do |sub|
    sub.update_attribute(:last_version_string, version)
    Rails.logger.info "Notifying #{sub.email} of #{version}"
    NotificationMailer.delay.new_version_email(sub.email, version, version_url, sub.cancel_token)
  end
end