class OrderItem < ApplicationRecord
    belongs_to :order
    validates :order_id, :menu_item_id, :menu_item_name, :menu_item_price, :quantity, presence: true
    def self.find_order_items(order_id)
        OrderItem.where("order_id = ?",order_id)
    end  
    
    def self.find_total(order_items)
        total = 0
        order_items.all.each do|item|
            total = total + (item.menu_item_price*item.quantity)
        end 
        total   
    end    
end  