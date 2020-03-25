class SessionsController < ApplicationController

  def welcome
    render :index
  end 

  def new
  end

 
  def create
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    else
        flash[:no_match] = "Invalid Username or Password"
        render :new
    end
  end


  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end



  



end 
