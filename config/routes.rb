Rails.application.routes.draw do
  devise_for :users

  get 'pages/weekplanner'
  post 'pages/weekplanner'

  post 'pages/weekplanner/update_results' => 'pages#update_results'
  post 'pages/weekplanner/update_shopping_list' => 'pages#update_shopping_list'

  get 'pages/search'
  post 'pages/search'

  get 'pages/info'

  resources :categories
  resources :recipes

  root :to => 'categories#index'
end
