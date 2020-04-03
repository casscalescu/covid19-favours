Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update, :show]
  resources :favours do
    resources :favour_applications, only: [:new, :create, :index]
  end
  resources :favour_applications, only: [:destroy]
end
