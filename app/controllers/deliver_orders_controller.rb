class DeliverOrdersController < ApplicationController
    protect_from_forgery except: :index
    skip_before_action :ensure_logged_in
    
    def index
        @not_delivered = Order.joins(:user).where(orders: {order_delivered: false}).order("id ASC")
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