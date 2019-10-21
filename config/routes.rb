Rails.application.routes.draw do
  get 'users/show'
  get 'albums/index'
  get 'albums/show'

  root 'albums#index'
end
