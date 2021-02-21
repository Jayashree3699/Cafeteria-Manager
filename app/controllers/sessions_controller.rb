class SessionsController < ApplicationController
    skip_before_action :ensure_logged_in
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:current_user_id] = user.id
            
            cart = Cart.find_or_create_by(user_id: user.id)
            session[:current_cart_id] = cart.id
            redirect_to menus_path
            
        else
            redirect_to "/"
        end    
    end    
end    