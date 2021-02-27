class ApplicationController < ActionController::Base
    before_action :ensure_logged_in
    def ensure_logged_in
        
        unless current_user 
            redirect_to "/"
        end
    end    

    def ensure_cart_created
        unless current_cart
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

    def ensure_is_clerk_or_owner
        unless @current_user.role == "clerk" || @current_user.role == "owner"
            redirect_to "/"
        end    
    end   
    def ensure_is_clerk_or_customer
        unless @current_user.role == "clerk" || @current_user.role == "customer"
            redirect_to "/"
        end    
    end 
    
    def ensure_is_owner
        unless @current_user.role == "owner"
            redirect_to "/"
        end    
    end  
    def ensure_is_clerk
        unless @current_user.role == "clerk"
            redirect_to "/"
        end    
    end  
end
