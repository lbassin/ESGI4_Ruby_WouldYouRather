module UsersHelper
  def require_login
    unless session[:user_id]
      flash[:error] = "You must be logged in to access this section"
      redirect_to users_login_path
    end
  end
end
