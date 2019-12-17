class Admin::AdminController < ApplicationController
  before_action :check_login
  before_action :check_user
  layout "admin/application"
  def home
    render "layouts/admin/application"
  end

  private

  def check_admin
    return if current_user.admin?

    redirect_to root_path
    flash[:danger] = t "msg.danger_permission"
  end

  def check_login
    return if logged_in?

    redirect_to root_path
    flash[:danger] = t "msg.login"
  end

  def check_user
    return unless current_user.user?

    redirect_to root_path
    flash[:danger] = t "msg.danger_permission"
  end
end
