class MenusController < ApplicationController 
    before_action :ensure_is_owner
    def index
        @menus = Menu.all
        render "owner_view"
    end   

    def create
        name = params[:name]
        if (name.downcase!="name") && !Menu.name_exists?(name)
            menu = Menu.new(name: params[:name],enabled: false)
            if !menu.save
                flash[:error] = menu.errors.full_messages.join(", ")
                redirect_to menus_path and return
            end
        else  
            flash[:error] = "Name Already Exists Or Invalid"
            redirect_to menus_path and return
        end      
        redirect_to "/menus/#{menu.id}/menu_items"
    end    
    def destroy
        id = params[:id]
        if Menu.destroyed?(id)
            flash[:success] = "Menu Category Deleted"
        else  
            flash[:error] = "Error Occured. Try Again" 
        end     
        redirect_to menus_path
    end 
    def update
        id = params[:id]
        enabled = params[:enabled]
        if Menu.exists?(id)
            menu = Menu.find(id)
            menu.enabled = enabled
            menu.save
        else    
            flash[:error] = "Error Occured. Try Again"
        end    
        redirect_to menus_path
    end       

end    