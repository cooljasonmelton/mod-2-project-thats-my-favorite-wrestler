class FavoriteMovesController < ApplicationController
    before_action :authorized

    def index
        @favorite_moves = FavoriteMove.all 
    end 

    def new
        @favorite_move = FavoriteMove.new
    end

    def create
        @favorite_move = FavoriteMove.new
    end 

    private
    def fav_move_params
                
    end 

    def get_user_id
        current_user.id.to_i
    end

end
