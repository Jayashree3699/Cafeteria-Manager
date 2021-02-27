class CartsController < ApplicationController 
   before_action :ensure_cart_created , :ensure_is_clerk_or_customer
   def index
        render "menu"
   end  
end    