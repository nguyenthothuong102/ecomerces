class Admin::AdminController < ApplicationController
  layout "admin/application"
  def home
    render "layouts/admin/application"
  end
end
