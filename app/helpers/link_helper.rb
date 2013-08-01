module LinkHelper
  def confirm_subscription_url(subscription)
    confirm_subscriptions_url(confirm_token: subscription.confirm_token)
  end

  def cancel_subscription_url(cancel_token)
    cancel_subscriptions_url(cancel_token: cancel_token)
  end
end