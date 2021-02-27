class ManageOwnersController < ApplicationController
    skip_before_action :ensure_logged_in
    def index
        @owners= User.owners
        render "all_owners"
    end  
    def edit
        id = params[:id]
        @owner = User.find(id)
        render "edit_owner"
    end    
    
    def update
        id = params[:id]
        owner = User.find(id)
        owner.name = params[:name]
        owner.email = params[:email]
        owner.save
        redirect_to manage_owners_path
      
    end 
    def new
        render "new_owner"
    end 
    def create
        User.create!(
            name: params[:name],
            email: params[:email],
            role: "owner",
            password: params[:password]
        )
        redirect_to manage_owners_path
    end  
    def destroy
        id = params[:id]
        owner = User.find(id)
        owner.destroy
        redirect_to manage_owners_path
    end            
end    