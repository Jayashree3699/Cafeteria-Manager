Rails.application.routes.draw do
  get "/" => "home#index"

  get "/signin" => "sessions#new" , as: :new_sessions
  post "/signin" => "sessions#create" , as: :sessions
  delete "/signout" => "sessions#destroy" , as: :destroy_session

  get "/owner_signin" => "owner_session#index" , as: :new_owner_session
  post "/owner_signin" => "owner_session#create" , as: :owner_session
  
  
  get "/clerk_home" => "clerks#index" , as: :clerk_home

  get "/owner" => "owner#index" , as: :owner
  get "/all_users" => "all_users#index" , as: :all_users
  get "/manage_all_users" => "manage_all_users#index" , as: :manage_all_users

  get "/reports_filter" => "reports#filter" , as: :reports_filter


  resources :manage_clerks
  resources :manage_owners
  resources :place_orders
  resources :customers
  resources :users
  resources :deliver_orders
  resources :reports
  resources :orders
  
  resources :menus do
    resources :menu_items
  end  
  
  resources :carts do
    resources :cart_items
  end  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
