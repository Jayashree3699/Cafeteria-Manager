class SessionsController < ApplicationController
    skip_before_action :ensure_logged_in
    def new
        render "new"
    end    
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password]) && (user.role == "customer" || user.role == "clerk")
            session[:current_user_id] = user.id
            
            cart = Cart.find_or_create_by(user_id: user.id)
            session[:current_cart_id] = cart.id
            if (user.role == "customer")
                redirect_to customers_path
            else    
                redirect_to clerk_home_path
            end    
            
        else
            flash[:error] = "Invalid Credentials. Please Try Again"
            redirect_to "/"
        end    
    end  
    
    def destroy
        session[:current_user_id] = nil
        @current_user = nil
        @current_cart = nil
        redirect_to "/"
    end    
end    