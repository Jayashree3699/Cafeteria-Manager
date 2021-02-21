class ApplicationController < ActionController::Base
    before_action :ensure_logged_in
    def ensure_logged_in
        
        unless current_user && current_cart
            redirect_to "/"
        end
    end    

    def current_user
        return @current_user if @current_user
        current_user_id = session[:current_user_id]
        if current_user_id
            @current_user = User.find(current_user_id)
        else  
            nil
        end      
    end
    
    def current_cart
        return @current_cart if @current_cart
        current_cart_id = session[:current_cart_id]
        if current_cart_id
            @current_cart = Cart.find(current_cart_id)
        else  
            nil
        end      
    end    
end
