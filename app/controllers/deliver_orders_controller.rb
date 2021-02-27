class DeliverOrdersController < ApplicationController
    
    before_action :ensure_is_clerk_or_owner
    
    def index
        @not_delivered = Order.joins(:user).where(orders: {order_delivered: false})
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