class SessionsController < ApplicationController

  add_flash_types :success, :info, :warning, :danger

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'ログインしました'
      redirect_to columns_path
    else
      render 'home/index'
      flash[:danger] = 'ログインできませんでした'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
