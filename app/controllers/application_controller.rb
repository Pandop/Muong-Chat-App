class ApplicationController < ActionController::Base 

  helper_method :current_user

  def current_user
    session[:username]
  end

end
