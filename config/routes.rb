Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'style-guide', to: 'pages#style_guide'
  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update, :show]
  resources :favours do
    resources :favour_applications, only: [:new, :create, :update, :index]
    resources :reviews, only: [ :new, :create ]
  end
end
