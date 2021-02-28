class ReportsController < ApplicationController
    skip_before_action :ensure_logged_in
    def index
        render "home"
    end    

    def create
        from_date = params[:from_date]
        to_date = params[:to_date]
        orders = Order.joins(:user).select("users.name as user_name, users.email as user_email, orders.id as order_id , orders.date as date ").where("date >= ? AND date <= ?",from_date , to_date).order(date: :asc , id: :asc)
        @orders_placed = orders.collect{|n| [n.order_id , n.date , n.user_name , n.user_email]}
        render "search_result"
    end  
    def show
        id = params[:id]
        @order = Order.find(params[:id])
        user_id = @order.user_id
        @user = User.find(user_id)
        @order_items = OrderItem.where(order_id: params[:id])
        @total = 0
        @order_items.all.each do|item|
            @total = @total + (item.menu_item_price*item.quantity)
        end    
        render "invoive"
    end    
end    