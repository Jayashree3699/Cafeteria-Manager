class ReportsController < ApplicationController
    before_action :ensure_is_owner

    def index
        render "home"
    end    

    def create
        from_date = params[:from_date]
        to_date = params[:to_date]
        if Order.is_valid_range(from_date , to_date)
            @orders_placed = Order.search_between_dates(from_date , to_date)
            render "search_result"
        else  
            flash[:error] = "Date Invalid"
            render "home"
        end      
    end  
    def show
        id = params[:id]
        if Order.exists?(id)
            @order = Order.find(params[:id])
            user_id = @order.user_id
            @user = User.find(user_id)
            @order_items = OrderItem.find_order_items(id)
            @total = OrderItem.find_total(@order_items)
            render "invoive"
        else 
            flash[:error] = "Invalid"
            render "home"
        end    
    end    
end    