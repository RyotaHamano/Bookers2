Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get '/home/about' => 'homes#about', as:"about"
  get '/search' => 'searches#search', as:"search"
  devise_for :users
  resources :books, only: [:index, :show, :edit, :create, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update] do 
    member do 
      get :follows, :followers
    end
    resource :relationships, only: [:create, :destroy]
  end
  devise_scope :user do
    post "users/guest_sign_in", to:"users/sessions#guest_sign_in"
  end
end
