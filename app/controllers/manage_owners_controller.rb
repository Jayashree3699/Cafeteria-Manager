class ManageOwnersController < ApplicationController
    before_action :ensure_is_owner
    def index
        @owners= User.owners
        render "all_owners"
    end  
    def edit
        id = params[:id]
        if User.owners.exists?(id)
            @owner = User.find(id)
            render "edit_owner"
        else  
            flash[:error] = "Invalid"
            redirect_to manage_owners_path
        end      
    end    
    
    def update
        id = params[:id]
        if User.owners.exists?(id)
            owner = User.find(id)
            owner.name = params[:name]
            owner.email = params[:email]
            if owner.save
                flash[:success] ="Updated"
            end    
        else  
            flash[:error] = "Invalid"  
        end    
        redirect_to manage_owners_path
      
    end 
    def new
        render "new_owner"
    end 
    def create
        user = User.new(
            name: params[:name],
            email: params[:email],
            role: "owner",
            password: params[:password]
        )
        if user.save
            flash[:success] = "Added Successfully"
        else  
            flash[:error] = "Invalid"  
        end    
        redirect_to manage_owners_path
    end  
    def destroy
        id = params[:id]
        if User.owners.exists?(id)    
            owner = User.find(id)
            owner.destroy
        else
            flash[:error] = "Some Error Occured.Try Again" 
        end      
        redirect_to manage_owners_path
    end            
end    