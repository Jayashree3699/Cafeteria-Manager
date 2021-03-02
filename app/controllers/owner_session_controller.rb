class OwnerSessionController < ApplicationController
    skip_before_action :ensure_logged_in
    def index
        render "owner_signin"
    end    
    
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password]) && (user.role == "owner")
            session[:current_user_id] = user.id
            redirect_to owner_path
        else
            flash[:error] = "Invalid Credentials. Please Try Again"
            redirect_to new_owner_session_path
        end    
    end  
    
end    