Rails.application.routes.draw do
  resources :vacation_activities
  resources :user_vacations
  resources :vacations
  resources :activities
  resources :destinations
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
