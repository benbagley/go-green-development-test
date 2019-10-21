Rails.application.routes.draw do
  resources :albums
  resources :users

  root 'albums#index'
end
