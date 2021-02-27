class PlaceOrdersController < ApplicationController
    before_action :ensure_cart_created , :ensure_is_clerk_or_customer
    def index
        render "order_placed"
    end

    def create
        @order = Order.create!(date: Date.today, user_id: @current_user.id, order_delivered: false)
        cart = Cart.find_by(user_id: @current_user.id)
        CartItem.where(cart_id: @current_cart.id).each do |cart_item|
            OrderItem.create!(
                order_id: @order.id,
                menu_item_id: cart_item.menu_item_id,
                menu_item_name: cart_item.menu_item_name,
                menu_item_price: cart_item.menu_item_price,

            )
            cart_item.destroy
        end 
        
        render "order_placed"
    end  

    def destroy

    end      
end
