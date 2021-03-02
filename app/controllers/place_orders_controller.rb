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
        #cart = Cart.find_by(user_id: @current_user.id)
=begin
        CartItem.current_cart_items(current_cart).each do |cart_item|
            order_item = OrderItem.new(
                order_id: @order.id,
                menu_item_id: cart_item.menu_item_id,
                menu_item_name: cart_item.menu_item_name,
                menu_item_price: cart_item.menu_item_price,
                quantity: cart_item.menu_item_quantity
            )
            if !order_item.save
                return false
            end    
            cart_item.destroy
        end 
=end
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
