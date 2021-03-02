class Order < ApplicationRecord
    has_many :order_items
    belongs_to :user

    def self.not_delivered
        orders = Order.joins(:user).select("users.name as user_name, users.email as user_email, orders.id as order_id").where(orders: {order_delivered: false})
        orders.collect{|order| [order.user_name , order.user_email , order.order_id]}
    end 
    
    def self.search_between_dates(from_date , to_date)
        orders = Order.joins(:user).select("users.name as user_name, users.email as user_email, orders.id as order_id , orders.date as date ").where("date >= ? AND date <= ?",from_date , to_date).order(date: :asc , id: :asc)
        orders.collect{|n| [n.order_id , n.date , n.user_name , n.user_email]}
    end  
    
    def self.is_valid_range(from_date , to_date)
       (Date.parse(to_date) >= Date.parse(from_date)) && (Date.parse(to_date) <= Date.today)
    end    
end