class CustomersController < ApplicationController
    before_action :ensure_cart_created , :ensure_is_clerk_or_customer
    def index
        menus = Menu.where(enabled: true)
        @items = Array.new
        menus.all.each do |menu|
            MenuItem.where(menu_id: menu.id).each do |item|
                @items.push(item)
            end    
        end    
        @total = 0
        CartItem.where(cart_id: @current_cart.id).each do |cart_item|
            @total = @total + (cart_item.menu_item_quantity * cart_item.menu_item_price)
        end    
        render "menu"
    end    
end    