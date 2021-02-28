class DeliverOrdersController < ApplicationController
    
    before_action :ensure_is_clerk_or_owner
    
    def index
        not_delivered = Order.joins(:user).select("users.name as user_name, users.email as user_email, orders.id as order_id").where(orders: {order_delivered: false})
        @not_delivered = not_delivered.collect{|n| [n.user_name , n.user_email , n.order_id]}
        render "pending_delivery"
    end    
    
    def update
        id = params[:id]
        order = Order.find_by(id: id)
        order.order_delivered = true
        order.save
        redirect_to deliver_orders_path
    end    
end    