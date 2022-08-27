class ApplicationController < ActionController::Base
  before_action :set_current_user

  def current_user
     session[:user_id] && User.find(session[:user_id])

  end

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end

  end

end
