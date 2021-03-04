class PlaceOrdersController < ApplicationController
    before_action :ensure_cart_created , :ensure_is_clerk_or_customer
    def index
        @total = CartItem.cart_total(current_cart)
        @cart_items =  CartItem.current_cart_items(current_cart)
        render "confirm_order"
    end

    def create
        @order = Order.create!(
            date: Date.today, 
            user_id: @current_user.id, 
            delivered_on: nil, 
            order_delivered: false
        )
       
        if CartItem.make_order(@order.id , current_cart)
            flash[:success] = "Order Placed Successfully"
            
        else    
            flash[:error] = "Error Occured. Check Your Order"
        end
        redirect_to customers_path
    end  

    def destroy

    end      
end
