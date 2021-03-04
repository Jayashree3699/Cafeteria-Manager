class DeliverOrdersController < ApplicationController
    
    before_action :ensure_is_clerk_or_owner
    
    def index
        @not_delivered = Order.not_delivered
        render "pending_delivery"
    end    
        
    def update      
        id = params[:id]
        if Order.not_delivered_orders.find(id)
            order = Order.find_by(id: id)
            order.delivered_on = Date.today
            order.order_delivered = true
            if order.save
                flash[:success] = "Updated Successfully"
            end    
        else  
            flash[:error] = "Invalid"
        end        
        redirect_to deliver_orders_path
    end    
end    