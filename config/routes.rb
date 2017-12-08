Rails.application.routes.draw do


  root 'welcome#home'
  get 'signup', to: 'users#new', as: 'signup'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'


  resources :activities, only: [:index, :update]
  resources :destinations, only: :index
  resources :users do
    resources :vacations, except: :show
  end
  resources :vacations, only: :show
  resources :types do
    resources :activities, only: :show
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
