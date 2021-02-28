class Order < ApplicationRecord
    has_many :order_items
    belongs_to :user

    def self.not_delivered
        orders = Order.joins(:user).select("users.name as user_name, users.email as user_email, orders.id as order_id").where(orders: {order_delivered: false})
        orders.collect{|order| [order.user_name , order.user_email , order.order_id]}
    end    
end    