Rails.application.routes.draw do
  devise_for :users
  get 'articles/index'
  get 'static_pages/home'
  get 'static_pages/about'
  root 'static_pages#home'
  resources :articles
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
