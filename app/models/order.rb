class Order < ApplicationRecord

    belongs_to :user
    has_many :order_items
    def self.not_delivered
        orders = Order.joins(:user).select("users.name as user_name, users.email as user_email, orders.id as order_id, orders.date as order_date").where(orders: {order_delivered: false})
        orders.collect{|order| [order.user_name , order.user_email , order.order_id , order.order_date]}
    end 
    
    def self.search_between_dates(from_date , to_date)
        orders = Order.joins(:user).select("users.name as user_name, users.email as user_email, users.role as user_role, orders.id as order_id , orders.date as date ").where("date >= ? AND date <= ?",from_date , to_date).order(date: :asc , id: :asc)
        orders.collect{|n| [n.order_id , n.date , n.user_name , n.user_email , n.user_role]}
    end  
    
    def self.is_valid_range(from_date , to_date)
       (Date.parse(to_date) >= Date.parse(from_date)) && (Date.parse(to_date) <= Date.today)
    end    
    def self.not_delivered_orders
        all.where("order_delivered = ?",false)
    end   
    
    def self.are_customers(orders)
        customers = Array.new
        orders.each do |order|
            if order[4] == "customer"
                customers.push(order)
            end        
        end 
        customers   
    end    
    
    def self.are_walk_in_customers(orders)
        walk_in_customers = Array.new
        orders.each do |order|
            if order[4] == "clerk"
                walk_in_customers.push(order)
            end        
        end 
        walk_in_customers 
    end  
    
    def self.of_user(current_user_id)
        all.where("user_id = ?",current_user_id)
    end    

end