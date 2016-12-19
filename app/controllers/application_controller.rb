class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?, :require_user
  
  
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def logged_in?
    !!current_user
  end
  helper_method :current_user, :signed_in?

  def current_user=(user)
    @current_user = user
    session[:user_id] = user.nil? ? user : user.id
  end
  
  # def current_user
  #   @current_user ||= User.find(session[:user_id]) if session[:user_id]
  # end
  
  # def logged_in?
  #   !!current_user
  # end
  
  # def is_admin?
  #   if logged_in?
  #     current_user.organization_admins.count > 0
  #   end
  # end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to do that!"
      redirect_to :back
    end
  end
  
  # def already_user
  #   if logged_in?
  #     flash[:danger] = "You are already signed in"
  #     redirect_to events_path
  #   end
  # end
end
