Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :items do
    member do
      post :charges
    end
  end

  resources :charges, only: [:new, :create]

  resources :users, only: [:show, :update], controller: :profiles
  resource :profile
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
