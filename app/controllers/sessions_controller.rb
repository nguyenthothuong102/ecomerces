class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by email: params[:session][:email].downcase
    if @user&.authenticate params[:session][:password]
      flash[:success] = t "user.login_success"
      log_in @user
      redirect_to root_path
    else
      flash.now[:danger] = t "user.invalid_email"
      render :new
    end
  end

  def destroy
    log_out
    flash[:success] = t "user.logout_success"
    redirect_to login_path
  end
end
