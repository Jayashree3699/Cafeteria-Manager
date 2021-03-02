class Cart < ApplicationRecord
    has_many :cart_items
    validates :user_id , presence: true
    def self.cart_checked(cart_id, current_cart_id)
        current_cart_id.to_i == cart_id.to_i
    end     
end