Rails.application.routes.draw do
  resources :users
  
  resources :menus do
    resources :menu_items
  end  
  
  resources :carts do
    resources :cart_items
  end  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
