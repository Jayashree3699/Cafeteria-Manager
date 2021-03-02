class CartItem < ApplicationRecord
    belongs_to :cart
    validates :cart_id, :menu_id, :menu_item_id, :menu_item_name, :menu_item_price, :menu_item_quantity , presence: true
    
    def self.current_cart_items(current_cart)
        all.where(cart_id: current_cart.id)
    end    
   
    def self.cart_total(current_cart)
        total = 0
        all.where(cart_id: current_cart.id).each do |cart_item|
            total = total + (cart_item.menu_item_quantity * cart_item.menu_item_price)
        end 
        total   
    end 
   
    def self.item_exists?(cart_id , menu_item_id)
        CartItem.exists?(:cart_id => cart_id , :menu_item_id => menu_item_id)
    end  
    
    def self.retrieve_current_cart_items(cart_id , current_cart_id)
        if CartItem.cart_checked(cart_id , current_cart_id)
            all.where(cart_id: current_cart_id)
        end 
    end 
    
    def self.cart_checked(cart_id, current_cart_id)
        current_cart_id.to_i == cart_id.to_i
    end

    def self.make_order(order_id , current_cart)
        CartItem.current_cart_items(current_cart).each do |cart_item|
            order_item = OrderItem.new(
                order_id: order_id,
                menu_item_id: cart_item.menu_item_id,
                menu_item_name: cart_item.menu_item_name,
                menu_item_price: cart_item.menu_item_price,
                quantity: cart_item.menu_item_quantity
            )
            if !order_item.save
                return false
            end    
            cart_item.destroy
        end 
        return true
    end    
end    