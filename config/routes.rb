Rails.application.routes.draw do
  get "/" => "home#index"

  get "/signin" => "sessions#new" , as: :new_sessions
  post "/signin" => "sessions#create" , as: :sessions
  delete "/signout" => "sessions#destroy" , as: :destroy_session
  
  get "/owner" => "owner#index" , as: :owner
  get "/all_users" => "all_users#index" , as: :all_users
  get "/manage_all_users" => "manage_all_users#index" , as: :manage_all_users
  resources :manage_clerks
  resources :place_orders
  resources :customers
  resources :users
  resources :deliver_orders
  resources :menus do
    resources :menu_items
  end  
  
  resources :carts do
    resources :cart_items
  end  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
