Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'boards#index'

  resources :boards do
    resources :tasks, except: [:index] do
      resources :comments, only: [:new, :create] do
        resource :like, only: [:create, :destroy]
      end
    end
  end

  resource :profile, only: [:show, :edit, :update]
end
