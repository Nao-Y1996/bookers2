Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root 'home#index'
  get 'home/about', to: 'home#about'
  devise_for :users
  resources :users, only: [:index,:show,:edit,:update]
  #resources :books, only: [:index,:show,:create,:edit,:update,:destroy]
  resources :books do
  	resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
end
