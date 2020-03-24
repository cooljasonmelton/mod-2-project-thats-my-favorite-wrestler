class MovesController < ApplicationController

    def index
        @moves = Move.all
    end 

    def show
        find_move
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
    def find_move
        @move = Move.find(params[:id])
    end 
end
