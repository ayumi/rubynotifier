# This mailer is intended to be used with Sidekiq.
# To improve performance, avoid using ActiveRecord in the mailer methods,
# insetad passing explicit values.

class NotificationMailer < ActionMailer::Base
  default from: 'no-reply@rubynotifier.org'

  helper :link

  def new_version_email(email, version, version_url, cancel_token)
    @version = version
    @version_url = version_url
    @cancel_token = cancel_token

    mail(:to => email, :subject => "Ruby #{version} is released")
  end
end