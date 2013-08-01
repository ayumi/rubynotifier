class SubscriptionMailer < ActionMailer::Base
  default from: 'no-reply@rubynotifier.org'

  helper :link

  def confirmation_email(subscription)
    @subscription = subscription
    mail(:to => subscription.email, :subject => "Confirm your RubyNotifier.org subscription")
  end
end