class UsersController < ApplicationController
    before_action :authorized
    skip_before_action :authorized, only: [:new, :create] 
    
    def index
        @users = User.all
        get_current_user
    end 

    def show
        get_current_user.reload
        find_user
    end 

    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            @errors = @user.errors.full_messages
            render :new
        end 
    end 

    def edit
        @user = get_current_user
    end

    def update
        @user = get_current_user
        @user.assign_attributes(user_params)
        if @user.valid?
            @user.save
            redirect_to user_path(@user)
        else 
            @errors = @user.errors.full_messages
            render :edit
        end 
    end

    def areyousure
        get_current_user
        render :areyousure
    end 

    def destroy
        get_current_user.destroy
        FavoriteMove.clean_out_database
        FavoriteWrestler.clean_out_database
        redirect_to '/'
    end 

    private
    def find_user
        @user = User.find(params[:id])
    end 

    def user_params
        params.require(:user).permit(:name, :bio, :email, :password)
    end

    def get_current_user
        @current_user = User.find_by(id: session[:user_id])
    end 

end
