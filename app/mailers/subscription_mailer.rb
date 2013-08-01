class SubscriptionMailer < ActionMailer::Base
  default from: 'no-reply@rubynotifier.org'

  helper :link

  def confirmation_email(subscription)
    @subscription = subscription
    #@url = confirm_subscription_url(subscription)
    mail(:to => subscription.email, :subject => "Confirm your RubyNotifier.org subscription")
  end
end