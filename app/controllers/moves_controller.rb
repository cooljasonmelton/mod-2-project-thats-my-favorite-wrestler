class MovesController < ApplicationController
    before_action :authorized
    skip_before_action :authorized, only: [:index, :show]

    def index
        current_user
        @moves = Move.sort_move_by_name
    end 

    def show
        current_user 
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
