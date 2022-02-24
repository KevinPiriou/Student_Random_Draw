Rails.application.routes.draw do
  resources :users
  root 'users#index'
  
  get 'random_select', to: 'users#random_select'
  delete 'destroy_all_user', to: 'users#destroy_all_user'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
