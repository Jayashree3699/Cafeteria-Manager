class HomeController < ApplicationController 
    skip_before_action :ensure_logged_in
    def index
        if current_user
            redirect_to customers_path
        else 
            render "index" 
        end       
    end    
end    