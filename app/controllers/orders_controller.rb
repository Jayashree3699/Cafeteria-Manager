class OrdersController < ApplicationController
    before_action :ensure_is_clerk_or_customer
    def index

        @current_user_orders = Order.of_user(current_user.id)
        render "show"
        
    end 
end    