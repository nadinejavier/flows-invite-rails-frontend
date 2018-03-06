class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    id = session[:user_id]
    current_user = Unirest.get("http://localhost:3000/api/v1/users/#{id}").body
    active_user ||= current_user if session[:user_id]
  end
  
  helper_method :current_user

  def authenticate_user!
    redirect_to '/login' unless current_user
  end
end
