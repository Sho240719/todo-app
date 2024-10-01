Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#index'
  resource :timeline, only: [:show]

  resources :boards do
    resources :tasks, except: [:index] do
      resources :comments, only: [:new, :create] do
        resource :like, only: [:show, :create, :destroy]
      end
    end
  end

  resources :accounts, only: [:show] do
    resources :follows, only: [:create]
    resources :unfollows, only: [:create]
  end

  resource :profile, only: [:show, :edit, :update]
  resources :favorites, only: [:index]
end
