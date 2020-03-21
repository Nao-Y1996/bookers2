Rails.application.routes.draw do
  root 'home#index'
  get 'home/about', to: 'home#about'
  devise_for :users
  resources :users, only: [:index,:show]

end
