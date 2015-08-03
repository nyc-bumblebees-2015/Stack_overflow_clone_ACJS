module ApplicationHelper
    def user_can_edit(user_id)
      return (!session[:user_id].nil? && session[:user_id] == user_id.to_i)
    end

    def current_user
      User.find_by(id: session[:user_id])
    end

    def elapsed_time(datetime)
      current_time = Time.now
      distance_of_time_in_words(current_time,datetime)
    end

end
