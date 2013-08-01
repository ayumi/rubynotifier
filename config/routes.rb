Rubynotifier::Application.routes.draw do
  resources :subscriptions, only: [:new, :create] do
    collection do
      get 'confirm/:confirm_token', action: :confirm, as: :confirm
      get 'cancel/:cancel_token', action: :cancel, as: :cancel
    end
  end

  root to: 'subscriptions#new'
end
