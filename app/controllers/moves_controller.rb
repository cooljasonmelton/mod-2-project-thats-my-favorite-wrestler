class MovesController < ApplicationController
    before_action :authorized
    skip_before_action :authorized, only: [:index, :show]

    def index
        @moves = Move.sort_move_by_name
    end 

    def show
        get_current_user 
        find_move
        session[:move_id] = params[:id]
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

    def get_current_user
        @current_user = User.find_by(id: session[:user_id])
    end 
end
