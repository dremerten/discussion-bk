Rails.application.routes.draw do
  # default_url_options :host => "example.com"
  resources :channels
  resources :discussions do
    resources :replies
  end

  root 'discussions#index'

  devise_for :users, controllers: { registrations: 'registrations' }
end
