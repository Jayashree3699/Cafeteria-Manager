class ManageAllUsersController < ApplicationController
    skip_before_action :ensure_logged_in
    def index
        render "home"
    end    
end    