Rails.application.routes.draw do
  devise_for :users
  resources :books
  resources :users, only: [:index, :show]
end
