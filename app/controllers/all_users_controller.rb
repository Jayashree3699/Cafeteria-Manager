class AllUsersController < ApplicationController

    before_action :ensure_is_owner
    
    def index
        render "users"
    end    
end    