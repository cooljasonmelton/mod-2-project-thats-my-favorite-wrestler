class FavoriteMovesController < ApplicationController
    before_action :authorized

    def index
        @favorite_moves = FavoriteMove.all.reverse
    end 

    def new
        @favorite_move = FavoriteMove.new
    end

    def create
        @favorite_move = FavoriteMove.new(user_id: session[:user_id], move_id: session[:move_id])
        @favorite_move.assign_attributes(get_move_params)
        @favorite_move.save
        redirect_to favorite_moves_path
    end 

    private
    def get_move_params
        params.require(:favorite).permit(:rating, :comments)        
    end 
    

end
