class CustomersController < ApplicationController
    
    def index
        @total = 0
        CartItem.where(cart_id: @current_cart.id).each do |cart_item|
            @total = @total + (cart_item.menu_item_quantity * cart_item.menu_item_price)
        end    
        render "menu"
    end    
end    