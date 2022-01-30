Rails.application.routes.draw do
  get 'home/index'
  resources :types
  resources :categories
  resources :bookmarks
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
