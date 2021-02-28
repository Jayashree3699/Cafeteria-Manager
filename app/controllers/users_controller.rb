class UsersController < ApplicationController 
    skip_before_action :ensure_logged_in
    def new
        render "new"
    end    

    def create
        user = User.new(
            name: params[:name],
            email: params[:email],
            role: "customer",
            password: params[:password]
        )
        if user.save
            flash[:success] = "successfully signed-up. Please signin to continue"
            
        else  
            flash[:error] = user.errors.full_messages.join(", ")
        end   
        redirect_to "/"    
    end
end    