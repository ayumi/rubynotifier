class SubscriptionsController < ApplicationController

  before_filter :load_confirm_subscription, only: :confirm
  before_filter :load_cancel_subscription, only: :cancel

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.find_or_initialize_by_email(subscription_params[:email])

    # Existing Subscription
    if @subscription.persisted?
      if @subscription.is_subscribed?
        flash[:notice] = "You're already subscribed. Thanks for using RubyNotifier!"
        render :new
      else
        @subscription.generate_confirmation!
        render :create
      end

    # New Subscription
    else
      if @subscription.save
        @subscription.generate_confirmation!
        render :create
      else
        flash[:alert] = "Couldn't subscribe that email. Please check that you entered it correctly."
        render :new
      end
    end
  end

  def confirm
    @subscription.confirm_subscription!
  end

  def cancel
    @subscription.cancel_subscription!
  end


  private

  def subscription_params
    params.require(:subscription).permit(:email)
  end

  def load_confirm_subscription
    @subscription = Subscription.find_by_confirm_token(params[:confirm_token])
    if @subscription.blank?
      redirect_to new_subscription_path, alert: "Couldn't find a pending subscription with that token. Please try entering your email again."
    end
  end

  def load_cancel_subscription
    @subscription = Subscription.find_by_cancel_token(params[:cancel_token])
    if @subscription.blank?
      redirect_to new_subscription_path, alert: "Couldn't find a pending subscription with that token. Please try entering your email again."
    end
  end
end