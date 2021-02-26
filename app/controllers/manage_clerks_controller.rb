class ManageClerksController < ApplicationController
    skip_before_action :ensure_logged_in
    def index
        @clerks = User.clerks
        render "all_clerks"
    end    
    def update
        render plain: "inside update"
    end 
    def new
        render "new_clerk"
    end 
    def create
        
    end          
end    