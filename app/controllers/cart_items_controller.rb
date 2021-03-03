class CartItemsController < ApplicationController
    before_action :ensure_cart_created , :ensure_is_clerk_or_customer
    def create
        cart_item = CartItem.item_exists?(params[:cart_id] , params[:menu_item_id])
        if !cart_item && (Cart.cart_checked(params[:cart_id] , current_cart.id)) && MenuItem.of_menu(params[:menu_id]).exists?(params[:menu_item_id])
            menu_item = MenuItem.menu_item_details(params[:menu_id],params[:menu_item_id])
            cart_item = CartItem.new(  
                cart_id: params[:cart_id],
                menu_id: params[:menu_id],
                menu_item_id: params[:menu_item_id],
                menu_item_name: menu_item.name,
                menu_item_price: menu_item.price ,
                menu_item_quantity: 1
            )
            if cart_item.save
                flash[:success] = "Added to cart"
            else  
                flash[:error] = "Some error occured.Try again" 
            end    
        end    
        redirect_to customers_path
    end    

    def update 
        action = params[:change]
        id = params[:id]
        cart_id = params[:cart_id]
        cart_item = CartItem.retrieve_current_cart_items(cart_id , current_cart.id).find(id)
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