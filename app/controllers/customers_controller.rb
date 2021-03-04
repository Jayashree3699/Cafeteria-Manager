class CustomersController < ApplicationController
    before_action :ensure_cart_created , :ensure_is_clerk_or_customer
    def index
        @items = Menu.enabled_menu_items 
        @total = CartItem.cart_total(current_cart)
        @current_cart_items = CartItem.current_cart_items(current_cart) 
        @current_user = current_user
        render "menu"
    end    
end    