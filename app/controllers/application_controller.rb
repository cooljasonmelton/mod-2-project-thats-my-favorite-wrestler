class ApplicationController < ActionController::Base
    helper_method :logged_in?, :authorized

    def current_user    
        User.find_by(id: session[:user_id])  
    end
      
    def logged_in?
        !current_user.nil?  
    end

    def authorized
        flash[:error] = "Please Sign In or Create a User Page!"
        redirect_to '/' unless logged_in?
    end
end
