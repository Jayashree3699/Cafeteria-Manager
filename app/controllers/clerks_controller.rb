class ClerksController < ApplicationController
    before_action :ensure_is_clerk
    def index
        render "home"
    end    
end