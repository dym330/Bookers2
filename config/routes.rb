Rails.application.routes.draw do
  
  devise_for :users
  
  root to: "homes#top"
  get "home/about" => "homes#about"
  
  resources :users, only: [:show, :edit, :update, :index]
  resources :books, only: [:create, :show, :index, :edit, :destroy, :update]
end
