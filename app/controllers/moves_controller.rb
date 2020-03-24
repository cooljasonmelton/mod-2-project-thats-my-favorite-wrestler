class MovesController < ApplicationController

    def index
        @moves = Move.all
    end 

    def show
        find_move
    end 

    def new
        @move = Move.new
    end 

    def create
        @move = Move.new(move_params)
        if @move.valid?
            @move.save
            redirect_to move_path(@move)
        else
            #errors
            render :new 
        end 
    end 

    def edit
        find_move
    end

    def update
        find_move.assign_attributes(move_params)      
        if @move.valid?
            @move.save
            redirect_to move_path(@move)
        else
            #@errors
            render :new 
        end 
    end

    private
    def find_move
        @move = Move.find(params[:id])
    end 

    def move_params
        params.require(:move).permit(:name, :description, :img_url)
    end 
end
