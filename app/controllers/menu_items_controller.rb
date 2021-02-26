class MenuItemsController < ApplicationController 
    skip_before_action :ensure_logged_in
    def index
        render "owner_view_items"
    end    
    def create
        MenuItem.create!(menu_id: params[:menu_id],
                        name: params[:name],
                        description: params[:description],
                        price: params[:price]
        )
        redirect_to menu_menu_items_path

        
    end 
    
    def new
        render "new"
    end    

    def show
        render "owner_view_items"
    end   
    
    def edit
        render "item_edit"
    end  
    
    def update
        id = params[:id]
        item = MenuItem.find(id)
        item.name = params[:name]
        item.description = params[:description]
        item.price = params[:price]
        item.save
        redirect_to menu_menu_items_path
    end  
    def destroy
        id = params[:id]
        item = MenuItem.find(id)
        item.destroy
        redirect_to menu_menu_items_path
    end      
end    