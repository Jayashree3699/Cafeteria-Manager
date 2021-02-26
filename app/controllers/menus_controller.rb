class MenusController < ApplicationController 
    skip_before_action :ensure_logged_in
    protect_from_forgery except: :index
    def index
        
            render "owner_view"
           
           
    end    
    def create
        menu = Menu.create!(name: params[:name],enabled: false)

        redirect_to "/menus/#{menu.id}/menu_items"
         
    end    
    def destroy
        id = params[:id]
        menu = Menu.find(id)
        MenuItem.where("menu_id = ?",id).each do |item|
            item.destroy
        end    
        menu.destroy
        redirect_to menus_path
    end 
    def update
        id = params[:id]
        enabled = params[:enabled]
        menu = Menu.find(id)
        menu.enabled = enabled
        menu.save
        redirect_to menus_path
    end       

end    