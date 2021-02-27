class ManageClerksController < ApplicationController
    skip_before_action :ensure_logged_in
    def index
        @clerks = User.clerks
        render "all_clerks"
    end  
    def edit
        id = params[:id]
        @clerk = User.find(id)
        render "edit_clerk"
    end    
    
    def update
        id = params[:id]
        clerk = User.find(id)
        clerk.name = params[:name]
        clerk.email = params[:email]
        clerk.save
        redirect_to manage_clerks_path
      
    end 
    def new
        render "new_clerk"
    end 
    def create
        User.create!(
            name: params[:name],
            email: params[:email],
            role: "clerk",
            password: params[:password]
        )
        redirect_to manage_clerks_path
    end  
    def destroy
        id = params[:id]
        clerk = User.find(id)
        clerk.destroy
        redirect_to manage_clerks_path
    end            
end    