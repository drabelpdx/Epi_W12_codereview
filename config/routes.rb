Rails.application.routes.draw do
  devise_for :admins
  devise_for :users

  root :to => 'categories#index'

  resources :categories do
    resources :projects
  end

    resources :posts do
      resources :comments
    end
    
end
