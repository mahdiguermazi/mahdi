Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
    root "articles#index"
  
    resources :articles do
      resources :comments
    end

    namespace :api do
      namespace :v1 do
        resources :articles
      end
    end
  end



