class OwnerController < ApplicationController
    skip_before_action :ensure_logged_in
    def index
        render "owner_home"
    end    
end    