Rails.application.routes.draw do
  resources :warehouses
  resources :products
  resources :inventories
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
