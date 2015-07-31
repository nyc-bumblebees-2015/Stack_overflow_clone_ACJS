module ApplicationHelper
    def user_can_edit(user_id)
      return (!session[:user_id].nil? && session[:user_id] == user_id.to_i)
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

end
