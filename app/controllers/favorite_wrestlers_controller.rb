class FavoriteWrestlersController < ApplicationController
    before_action :authorized

    def index
        @favorite_wrestlers = FavoriteWrestler.all.reverse
    end 

    def new
        @favorite_wrestler = FavoriteWrestler.new
    end

    def create
        @favorite_wrestler = FavoriteWrestler.new(user_id: session[:user_id], wrestler_id: session[:wrestler_id])
        @favorite_wrestler.assign_attributes(get_wrestler_params)
        @favorite_wrestler.save
        redirect_to favorite_wrestlers_path
    end 

    private
    def get_wrestler_params
        params.require(:favorite).permit(:rating, :comments)        
    end 

end
