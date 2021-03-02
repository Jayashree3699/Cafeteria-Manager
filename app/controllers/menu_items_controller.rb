class MenuItemsController < ApplicationController 
    before_action :ensure_is_owner
    def index
        @id = params[:menu_id]
        if Menu.exists?(@id)
            @menu_items = MenuItem.of_menu(@id)
            render "owner_view_items"
        else  
            redirect_to menus_path
        end       
    end    
    def create
        if MenuItem.is_valid(params[:name] , params[:description])
            menu_item = MenuItem.new(
                menu_id: params[:menu_id],
                name: params[:name],
                description: params[:description],
                price: params[:price]
            )
            if menu_item.save
                flash[:success] = "Added Successfully"
            end    
        else  
            flash[:error] = "Invalid"  
        end    
        redirect_to menu_menu_items_path    
    end 
    
    def new
        @id = params[:menu_id]
        if Menu.exists?(@id)
            render "new"
        else  
            redirect_to menus_path
        end     
    end    

    def show
        render "owner_view_items"
    end   
    
    def edit
        menu_id = params[:menu_id]
        id = params[:id]
        if MenuItem.of_menu(menu_id).exists?(id)
            render "item_edit"
        else  
            redirect_to menus_path
        end      
    end  
    
    def update
        menu_id = params[:menu_id]
        id = params[:id]
        if MenuItem.of_menu(menu_id).exists?(id) && MenuItem.is_valid(params[:name], params[:description])
            item = MenuItem.find(id)
            item.name = params[:name]
            item.description = params[:description]
            item.price = params[:price]
            if item.save
                flash[:success] = "Updated"
            end    
        else  
            flash[:error] = "Invalid"
        end      
        #id = params[:id]
        #item = MenuItem.find(id)
        #item.name = params[:name]
        #item.description = params[:description]
        #item.price = params[:price]
        #item.save
        redirect_to menu_menu_items_path
    end  
    def destroy
        id = params[:id]
        item = MenuItem.find(id)
        item.destroy
        redirect_to menu_menu_items_path
    end      
end    