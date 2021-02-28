class CustomersController < ApplicationController
    before_action :ensure_cart_created , :ensure_is_clerk_or_customer
    def index
        #menus = Menu.enabled_menu
        #@items = Array.new
        #menus.all.each do |menu|
        #    MenuItem.where(menu_id: menu.id).each do |item|
        #        @items.push(item)
        #    end    
        #end   
        #@total = 0
        #CartItem.where(cart_id: @current_cart.id).each do |cart_item|
        #    @total = @total + (cart_item.menu_item_quantity * cart_item.menu_item_price)
        #end   
        @items = Menu.enabled_menu_items 
        @total = CartItem.cart_total(current_cart)
        @current_cart_items = CartItem.current_cart_items(current_cart) 
        render "menu"
    end    
end    