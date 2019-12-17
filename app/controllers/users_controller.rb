class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by id: params[:id]
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "users.created_successfully"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name,
                                 :email, :tel, :address, :password,
                                 :password_confirmation)
  end
end
