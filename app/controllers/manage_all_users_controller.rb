class ManageAllUsersController < ApplicationController
    before_action :ensure_is_owner
    def index
        render "home"
    end    
end    