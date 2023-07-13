Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  devise_for :users
  resources :books, only: [:index, :show, :edit]
  resources :users, only: [:index, :show, :edit]
end
