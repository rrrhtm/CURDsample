class ColumnsController < ApplicationController

  before_action :authenticate_user, {only: [:new, :edit, :update, :destroy]} 
  add_flash_types :success, :info, :warning, :danger

  def index
    @q = Column.search(params[:q])
    @columns = @q.result
    @columns = @q.result.page(params[:page]).per(20)

  end

  def new
    @column = Column.new(
      userid: @current_user.id,
      username: @current_user.name
    )
  end

  def create
    column = Column.create(column_params)
    if column.save
      flash[:success] = 'コラム登録完了'
      redirect_to action: 'index' 
    else
      redirect_to action: 'new'
    end
  end

  def show
    @column = Column.find(params[:id])
  end

  def edit
    @column = Column.find(params[:id])
  end

  def destroy
    column = Column.find(params[:id])
    column.delete
    flash[:success] = 'コラム削除完了'
    redirect_to columns_path
  end

  def update
    column = Column.find(params[:id])
    column.update(column_params)
    flash[:success] = 'コラム更新完了'
    redirect_to action: 'index' 
  end

  private

  def column_params
    params.require(:column).permit(:title, :body, :category, :state, :image, :userid, :username)
  end
end