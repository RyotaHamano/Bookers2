Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get '/home/about' => 'homes#about', as:"about"
  devise_for :users
  resources :books, only: [:index, :show, :edit]
  resources :users, only: [:index, :show, :edit]
  
end
