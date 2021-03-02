class ManageClerksController < ApplicationController
    before_action :ensure_is_owner
    def index
        @clerks = User.clerks
        render "all_clerks"
    end  
    def edit
        id = params[:id]
        if User.clerks.exists?(id)
            @clerk = User.find(id)
            render "edit_clerk"
        else  
            flash[:error] = "Invalid"
            redirect_to manage_clerks_path
        end        
    end    
    
    def update

        id = params[:id]
        if User.clerks.exists?(id)
            clerk = User.find(id)
            clerk.name = params[:name]
            clerk.email = params[:email]
            if clerk.save
                flash[:success] ="Updated"
            end    
        else  
            flash[:error] = "Invalid"  
        end    
        redirect_to manage_clerks_path
    end 
    def new
        render "new_clerk"
    end 
    def create
        user = User.new(
            name: params[:name],
            email: params[:email],
            role: "clerk",
            password: params[:password]
        )
        if user.save
            flash[:success] = "Added Successfully"
        else  
            flash[:error] = "Invalid"  
        end    
        redirect_to manage_clerks_path
    end 

    def destroy
        id = params[:id]
        if User.clerks.exists?(id)
            clerk = User.find(id)
            clerk.destroy
        else
            flash[:error] = "Some Error Occured.Try Again" 
        end        
        redirect_to manage_clerks_path
    end            
end    