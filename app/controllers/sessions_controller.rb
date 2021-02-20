class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            render plain: "correct !"
            
        else
            render plain: "incorrect"
        end    
    end    
end    