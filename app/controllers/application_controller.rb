class ApplicationController < ActionController::Base
  # include JsonWebToken
  # protect_from_forgery with: :exception
  # protect_from_forgery with: :null_session, if: Proc.new { |c| c.request.format.include? 'application/json' }

  before_action :set_current_user
   # protect_from_forgery with: :exception
  # before_action :authenticate_request

  def current_user
     session[:user_id] && User.find(session[:user_id])

  end

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end

  end

  #
  # private
  #   def authenticate_request
  #     header = request.headers["Authorization"]
  #     header = header.split(" ").last if header
  #     decoded = jwt_decode(header)
  #     @current_user = User.find(decoded[:user_id])
  #   end


end
