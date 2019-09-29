class UsersController < ApplicationController

  
  add_flash_types :success, :info, :warning, :danger
  
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'ユーザー登録完了'
      redirect_to columns_path
    else
      redirect_back(fallback_location: new_user_path, flash: {
        user: user,
        error_messages: user.errors.full_messages
      })
    end
  end

  def mypage
    @users = User.where(id: @current_user.id) 
    @columns = Column.where(userid: @current_user.id)
    
  end

  def edit
    @user = User.find_by(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update(user_params)
      flash[:success] = 'ユーザー情報更新完了'
      redirect_to action: 'mypage'
    else
      render 'edit'
      flash[:danger] = 'ユーザー情報更新失敗'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :mail, :password,:password_confirmation)
  end
end