class WrestlersController < ApplicationController
    before_action :authorized
    skip_before_action :authorized, only: [:index, :show] 

    def index
        @wrestlers = Wrestler.sort_wrestler_by_name
    end 

    def show
        get_current_user
        session[:wrestler_id] = params[:id]
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
        find_wrestler
    end

    def update
        find_wrestler.assign_attributes(wrestler_params)
        if @wrestler.valid?
            @wrestler.save
            redirect_to wrestler_path(@wrestler)
        else 
            # @errors
            render :new
        end 
    end

    private
    def find_wrestler
        @wrestler = Wrestler.find(params[:id])
    end 

    def wrestler_params
        params.require(:wrestler).permit(:name, :bio, :img_url)
    end 

    def get_current_user
        @current_user = User.find_by(id: session[:user_id])
    end 

end
