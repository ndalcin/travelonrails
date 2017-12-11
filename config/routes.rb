Rails.application.routes.draw do


  root 'welcome#home'
  get 'signup', to: 'users#new', as: 'signup'
  get '/auth/:provider/callback', to: 'sessions#create'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'activities/top_five', to: 'activities#top_five', as: 'top_five'

  resources :vacation_activities, only: :destroy

  resources :activities, only: [:index, :update]
  resources :destinations, only: :index
  resources :users do
    resources :vacations, except: :show
  end
  resources :vacations, only: [:show, :create, :destroy]
  resources :types do
    resources :activities, only: :show
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
