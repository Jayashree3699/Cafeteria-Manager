class UsersController < ApplicationController 
    def new
        render "users/new"
    end    
    def create
        User.create!(
            name: params[:name],
            email: params[:email],
            role: customer
            password: params[:password]
        )
    end
end    