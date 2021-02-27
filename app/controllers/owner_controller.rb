class OwnerController < ApplicationController
before_action :ensure_is_owner   
    def index
        render "owner_home"
    end    
end    