Rails.application.routes.draw do
  get "/" => "home#index"

  get "/signin" => "sessions#new" , as: :new_sessions
  post "/signin" => "sessions#create" , as: :sessions
  delete "/signout" => "sessions#destroy" , as: :destroy_session

  resources :customers
  resources :users

  resources :menus do
    resources :menu_items
  end  
  
  resources :carts do
    resources :cart_items
  end  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
