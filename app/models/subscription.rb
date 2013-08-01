class Subscription < ActiveRecord::Base
  validates :email, uniqueness: true, email: true

  def generate_confirmation!
    return false if is_subscribed?
    update_attribute(:confirm_token, SecureRandom.urlsafe_base64)
    SubscriptionMailer.confirmation_email(self).deliver!
  end

  def confirm_subscription!
    self.is_subscribed = true
    self.cancel_token = SecureRandom.urlsafe_base64
    save!
  end

  def cancel_subscription!
    self.is_subscribed = false
    save!
  end
end
