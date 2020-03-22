Rails.application.routes.draw do
  root 'home#index'
  get 'home/about', to: 'home#about'
  devise_for :users
  resources :users, only: [:index,:show,:edit,:update]
  #resources :books, only: [:index,:show,:create,:edit,:update,:destroy]
  resources :books
end
