class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #helper_method :current_user
   def current_user
      User.find_by(id: session[:user_id])
    end

    def require_login
      redirect_to root_path unless is_authenticated?
    end

    def is_authenticated?
      !!session[:user_id]
    end

    def user_can_edit(user_id)
      return (!session[:user_id].nil? && session[:user_id] == user_id.to_i)
    end
end
