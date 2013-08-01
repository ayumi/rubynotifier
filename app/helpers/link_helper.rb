module LinkHelper
  def base_url
    ENV["BASE_URL"]
  end

  def confirm_subscription_url(subscription)
    confirm_subscriptions_url(confirm_token: subscription.confirm_token)
  end

  def cancel_subscription_url(subscription)
    cancel_subscriptions_url(cancel_token: subscription.cancel_token)
  end
end