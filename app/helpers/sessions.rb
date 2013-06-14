helpers do

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def create_session(user)
    session[:user_id] = user.id
    current_user
  end

end
