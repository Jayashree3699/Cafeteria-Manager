class CartItemsController < ApplicationController
    def create
        cart_item = CartItem.exists?(:cart_id => params[:cart_id] , :menu_item_id => params[:menu_item_id])
        if !cart_item 
            CartItem.create!(
                cart_id: params[:cart_id],
                menu_id: params[:menu_id],
                menu_item_id: params[:menu_item_id],
                menu_item_name: params[:menu_item_name],
                menu_item_price: params[:menu_item_price],
                menu_item_quantity: 1
            )
        end    
        redirect_to customers_path
    end    

    def update 
        action = params[:change]
        id = params[:id]
        cart_item = CartItem.find(id)
        if action == "+"
            cart_item.menu_item_quantity +=1
        elsif  action == "-"
            cart_item.menu_item_quantity -=1
            if cart_item.menu_item_quantity == 0
                cart_item.destroy 
                redirect_to customers_path and return
            end    
        else
            render plain: "no changes"
        end 
        cart_item.save   
        redirect_to customers_path 
              
    end    
end    