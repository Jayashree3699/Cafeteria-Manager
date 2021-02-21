class UsersController < ApplicationController 
    skip_before_action :ensure_logged_in
    def new
        render "new"
    end    

    def create
        User.create!(
            name: params[:name],
            email: params[:email],
            role: "customer",
            password: params[:password]
        )
        redirect_to "/"
    end
end    