Rails.application.routes.draw do
  root 'home#index'

  resources :items do
    resources :charges, only: [:new, :create]
  end

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users, only: [:show, :update], controller: :profiles
  resource :profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
