class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user



  def current_user
    return unless session[:user_id]
    @current_user = User.find_by(id: session[:user_id])
  end

  def authenticate_user
    if session[:user_id] == nil
      flash[:danger] = "ログインが必要です" 
      redirect_to("/") 
    end
  end
end