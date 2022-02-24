Rails.application.routes.draw do
  resources :users
  root 'users#index'
  get 'random_select', to: 'users#random_select'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
