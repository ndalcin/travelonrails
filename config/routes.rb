Rails.application.routes.draw do


  root 'welcome#home'
  get 'signup', to: 'users#new', as: 'signup'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'activities/top_five', to: 'activities#top_five', as: 'top_five'

  resources :activities, only: [:index, :show]

  resources :destinations, only: :index

  resources :users do
    resources :vacations, only: [:index, :new, :create]
  end

  resources :vacations do
    resources :activities
  end

  resources :types do
    resources :activities, only: :index
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
