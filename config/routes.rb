Rails.application.routes.draw do


  root 'welcome#home'
  get 'signup', to: 'users#new', as: 'signup'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :vacation_activities
  resources :vacations do
    resources :activities, only: [:show]
  end
  resources :activities, only: [:index]
  resources :destinations
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
