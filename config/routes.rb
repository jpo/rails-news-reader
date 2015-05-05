Portal::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Root
  root to: 'pages#show', id: 'index'

  # News
  namespace :news do
    resource :subscriptions, only: [:show, :update]
  end

  resources :news do
    get 'entries', on: :collection
  end

  # Devise
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    match 'users/confirm' => 'devise/registrations#confirm',
          as: :confirm_user_registration
  end

  # Static Pages
  get '/*id' => 'pages#show', as: :page, format: false
end
