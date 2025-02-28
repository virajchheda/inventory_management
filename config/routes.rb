Rails.application.routes.draw do
  resources :warehouses
  resources :products, only: [:index, :edit, :show]
  resources :inventories, only: [ :edit, :update]

  root to: 'products#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
