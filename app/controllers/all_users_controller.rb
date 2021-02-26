class AllUsersController < ApplicationController
    skip_before_action :ensure_logged_in
    def index

        render "users"
    end    
end    