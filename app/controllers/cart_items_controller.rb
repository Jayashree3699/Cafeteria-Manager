class CartItemsController < ApplicationController
    def create
        CartItem.create!(
            cart_id: params[:cart_id],
            menu_id: params[:menu_id],
            menu_item_id: params[:menu_item_id],
            menu_item_name: params[:menu_item_name],
            menu_item_price: params[:menu_item_price],
            menu_item_quantity: 1
        )
        redirect_to "/menus"
    end    
end    