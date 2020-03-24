class WrestlersController < ApplicationController

    def index
        @wrestlers = Wrestler.sort_wrestler_by_name
    end 

    def show
        find_wrestler
    end 

    def new
        @wrestler = Wrestler.new 
    end 

    def create
        @wrestler = Wrestler.new(wrestler_params)
        if @wrestler.valid?
            @wrestler.save
            redirect_to wrestler_path(@wrestler)
        else 
            # @errors
            render :new
        end 
    end 

    def edit
    end

    def update
    end

    private
    def find_wrestler
        @wrestler = Wrestler.find(params[:id])
    end 

    def wrestler_params
        params.require(:wrestler).permit(:name, :bio, :img_url)
    end 

end
