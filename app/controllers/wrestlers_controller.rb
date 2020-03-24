class WrestlersController < ApplicationController

    def index
        @wrestlers = Wrestler.all
    end 

    def show
        find_wrestler
    end 

    def new
    end 

    def create
    end 

    def edit
    end

    def update
    end

    private
    def find_wrestler
        @wrestler = Wrestler.find(params[:id])
    end 

end
